clear all; close all; clc; 

figure_pos = [0 0 810 400];

axes_pos = [[80 80 350 300]; 
            [450 80 350 300]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));
N=256;
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
plot([s(1) s(1000)*(s(1000)/s(1))^10],[ranks(1) ranks(1000)*(ranks(1000)/ranks(1))^10],'k--','LineWidth',2)
labels('$n/N^2$','$C(n)$')
ylim([1.01e-4, 9]);
xlim([min(s)/2 200]);
legend({'Simulation','Fit ($\alpha=1.169$)'},'FontSize',14,'Interpreter','latex','location','northeast','box','off')

axes(a(2));
alpha = log(ranks(1000)/ranks(1)) / log(s(1000)/s(1));
r = sort(rand(1,length(s)).^(-1/(-alpha)));
plot(s, ranks,'.','Color',c(1,:),'MarkerSize',20);
fs = r/N^2;
franks = (length(fs):-1:1)/length(fs); 
plot(fs, franks,'.','Color',c(3,:),'MarkerSize',20);
set(gca,'xscale','log','yscale','log','yTicklabel','');
labels('$n/N^2$','')
ylim([1.01e-4, 9]);
xlim([min(s)/2 200]);
legend({'Simulation','Synthetic power law'},'FontSize',14,'Interpreter','latex','location','northeast','box','off')
