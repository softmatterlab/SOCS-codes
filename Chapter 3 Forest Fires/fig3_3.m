clear all; close all; clc; 

figure_pos = [0 0 800 400];

axes_pos = [[80 80 310 300]; 
            [480 80 310 300]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));
N=16;
T=false(N,N);
p=0.01;
f=0.2;
NF=1;
NN=10000;
n=1;
S=zeros(1,NN);
x=randi(N,1,NN); y=randi(N,1,NN);
while NF<NN
    T=T|(rand(N,N)<p);
    if rand<f
       C=bwlabel(T,4);
       if T(x(NF),y(NF))~= 0
       T(C==C(x(NF),y(NF)))=false;
       S(n)=sum(sum(C==C(x(NF),y(NF)))); 
       n=n+1;
       end
      NF=NF+1;
    end 
end

s = sort(S(S>0))/N^2;
ranks = (length(s):-1:1)/length(s); 
plot(s, ranks,'.','Color',c(1,:),'MarkerSize',20);
set(gca,'xscale','log','yscale','log')

labels('$n/N^2$','$C(n)$')
ylim([1.01e-4, 9]);
xlim([min(s)/2 2]);



axes(a(2));
N=128;
T=false(N,N);
p=0.01;
f=0.2;
NF=1;
NN=10000;
n=1;
S=zeros(1,NN);
x=randi(N,1,NN); y=randi(N,1,NN);
while NF<NN
    T=T|(rand(N,N)<p);
    if rand<f
       C=bwlabel(T,4);
       if T(x(NF),y(NF))~= 0
       T(C==C(x(NF),y(NF)))=false;
       S(n)=sum(sum(C==C(x(NF),y(NF)))); 
       n=n+1;
       end
      NF=NF+1;
    end 
end

s = sort(S(S>0))/N^2;
ranks = (length(s):-1:1)/length(s); 
plot(s, ranks,'.','Color',c(1,:),'MarkerSize',20);
set(gca,'xscale','log','yscale','log')

labels('$n/N^2$','$C(n)$')
ylim([1.01e-4, 9]);
xlim([min(s)/2 2]);