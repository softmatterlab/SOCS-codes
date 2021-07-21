clear all; close all; clc;
f1 = figure('Units','Pixels','Position',[100 100 600 600]);
% f2 = figure('Units','Pixels','Position',[700 100 600 600]);


L = 39;

S = round(rand(L,L))*7;


% S = ones(L,L)*0;
% number_defectors = 1;
% for t = 1:number_defectors
%     i = round(L*t/(number_defectors+1)); 
%     S(i,i)=7;
% end

% S = ones(L,L)*0;
% i=20;
% S(i-1:i+1,i-1:i+1) = 7;

Sup = S;
R = 0.56;
s = 1.5;
N=7;
mu = 0.01;
tt = 500;
pind = circshift(1:L,-1);
mind = circshift(1:L, 1);
coop = zeros(1,tt);
coop(1)= mean(mean(S));
for t=1:tt
    P = zeros(L,L);
    for i=1:L
        for j=1:L
            [p1, p2] = pd(R,s,N,S(i,j),S(pind(i),j));
            P(i,j) = P(i,j) + p1;
            P(pind(i),j) = P(pind(i),j) + p2;
            
            [p1, p2] = pd(R,s,N,S(i,j),S(i,pind(j)));
            P(i,j) = P(i,j) + p1;
            P(i,pind(j)) = P(i,pind(j)) + p2;
        end
    end
%     figure(f2);
%     imagesc(P);
  
    for i=1:L
        for j=1:L
           if rand < mu
               S(i,j)=round(rand*7);
           else
%                [A,ind]  = min([P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j) ]);
%                SS = [S(i,j) S(i,mind(j)) S(i,pind(j))  S(mind(i),j) S(pind(i),j)];
%                Sup(i,j) = SS(ind);
               
               
               A = min([P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
               SS = [S(i,j) S(i,mind(j)) S(i,pind(j))  S(mind(i),j) S(pind(i),j)];
               if sum(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)])>1
                   Sup(i,j) = SS(randsample(find(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]),1));
               else
                   Sup(i,j) = SS(A==[P(i,j) P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
               end
               
%                A = min([P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
%                SS = [S(i,mind(j)) S(i,pind(j))  S(mind(i),j) S(pind(i),j)];
%                if sum(A==[P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)])>1
%                    Sup(i,j) = SS(randsample(find(A==[P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]),1));
%                else
%                    Sup(i,j) = SS(A==[P(i,mind(j)) P(i,pind(j))  P(mind(i),j) P(pind(i),j)]);
%                end
               
           end
        end
    end
    S = Sup;
%     figure(f1);
    imagesc(S);
    coop(t+1)=mean(mean(S));
%     colorbar;
    pause(0.001);
    disp(t);
end

             


imagesc(S);