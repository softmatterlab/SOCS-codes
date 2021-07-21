clear all; close all; clc; 

h = figure('Color','w','Units','Pixels','Position',[0 0 600 400]);

colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes('Units','Pixels','Position',[80 80 500 300]);

N=128;
T=false(N,N);
p=0.01;
f=0.2;
NF=1;
NN=1000;
n=1;
S=zeros(1,NN);
fS=zeros(1,NN);
x=randi(N,1,NN); y=randi(N,1,NN);
while NF<NN
    T=T|(rand(N,N)<p);
    if rand<f
       C=bwlabel(T,4);
       if T(x(NF),y(NF))~= 0
       fp = sum(sum(T))/N^2;
       T(C==C(x(NF),y(NF)))=false;
       S(n)=sum(sum(C==C(x(NF),y(NF))));
       
       R = rand(N,N);               % Random numbers for fake forest
       minimum = min(min(R));       % Start fire in the highest random number
       [xf,yf]=find(R==minimum);      % get position
       fT = R < fp;
       fC=bwlabel(fT,4);
       fS(n)=sum(sum(fC==fC(xf,yf))); 
       
       
       n=n+1;
       end
      NF=NF+1;
    end 
end

s = sort(S(S>0))/N^2;
ranks = (length(s):-1:1)/length(s); 
plot(s, ranks,'.','Color',c(1,:),'MarkerSize',20);
hold on 
fs = sort(fS(fS>0))/N^2;
franks = (length(fs):-1:1)/length(fs); 
plot(fs, franks,'.','Color',c(3,:),'MarkerSize',20);

set(gca,'xscale','log','yscale','log')
legend({'Forest grown with fires','Randomly generated forest'},'FontSize',16,'Interpreter','latex','location','southwest')
labels('$n/N^2$','$C(n)$')
ylim([1.01e-4, 9]);
xlim([min(s)/2 2]);