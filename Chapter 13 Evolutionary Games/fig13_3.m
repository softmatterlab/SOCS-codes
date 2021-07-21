clear all; close all; clc; 
figure_pos = [0 100 850 500];

yshift = 60;

axes_pos = [[75 80 340 340];
            [505 80 340 428]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));
N = 10;
R = 0.5;
S = 1.5;
p =zeros(1,N+1);
n2 = N-4;
for n = 0:N
    p(n+1) = pd(R,S,N,n,n2);
end
plot([6 6],[5 11],'k--','LineWidth',2)
plot(0:N,p,'.','color',c(1,:),'MarkerSize',35);
labels('$n$','Years in prison');
ylim([5.5 10.5]);


axes(a(2));

n1 = zeros(1,N+1);
n2 = zeros(1,N+1);
p = zeros(N+1,N+1);
for n1 = 0:N
    for n2=0:N
        p(n1+1,n2+1) = pd(R,S,N,n1,n2);
    end
end
imagesc(p);
C = zeros(100,3);
for t=1:100
    C(t,:)=c(1,:)*(1-(t/100))+c(2,:)*t/100;
end
% colormap(C);
xlim([0.5 11.5]);
ylim([0.5 11.5]);
set(gca,'xTick',[1 3 5 7 9 11],'xTicklabel',{'0','2','4','6','8','10'});
set(gca,'yTick',[1 3 5 7 9 11],'yTicklabel',{'0','2','4','6','8','10'});
labels('$m$','$n$')
plot([1 12],[0 11],'k--','LineWidth',2);
colorbar('northoutside');
title('Years in prison')


