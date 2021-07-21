% p = 0.02:0.02:0.5;
% C = zeros(1,length(p));
% for ind = 1:length(p)
%     n = 500;
%     A = zeros(n,n);
% 
%     for i=1:n
%         for j=(i+1):n
%             A(i,j)=rand<p(ind);
%             A(j,i)=A(i,j);
%         end
%     end
%     C(ind) = mean(mean(pathlength(A)));
%     disp(ind);
% end
% plot(p,C,'.','Markersize',25)
% 
% 



n = 15;
A = zeros(n,n);
p = 0;
c = 4; 
beta = 0.2;
phi = (1:n)/n*2*pi;
xy= [sin(phi); cos(phi)]';

for i=1:n
    for j=i+1:i+c/2
        ind = mod(j-1,n)+1;
        A(i,ind)=1;
        A(ind,i)=1;
    end
end
k = sum(A);
trace(A^3)/(sum(k.*(k-1)))
3*(c-2)/4/(c-1)