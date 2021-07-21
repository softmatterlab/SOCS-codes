clear all; close all; clc;

figure_pos = [0 0 850 490];

axes_pos = [[10 80 350 350]; 
            [490 80 350 350]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


N = 1000;
n = 100;
d = 0.8;
B = 0.6;
g = 0.01;
t = 100;
axes(a(1));
[x,y,S,I,R] = simulate_SIR(N,n,d,B,g,t);
plot(x(I),y(I),'.','Color',c(4,:),'MarkerSize',15);    % You need to choose a suitable markersize 
plot(x(R),y(R),'.','Color',c(3,:),'MarkerSize',15);
plot(x(S),y(S),'.','Color',c(1,:),'MarkerSize',15);
title(['t= ' num2str(t)]);              % Time display
xlim([-1 n]); ylim([-1 n]);           
set(gca,'xTick',[],'yTick',[]);
fill([0 1 1 0 0]*7+2,88+[0 0 1 1 0]*9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
title(['$t=$ ' int2str(t)],'FontSize',22,'Interpreter','latex')

axes(a(2));
t = 1000;
[x,y,S,I,R,SIR] = simulate_SIR(N,n,d,B,g,t);
plot(SIR(1,:),'Color',c(1,:),'LineWidth',3)
plot(SIR(2,:),'Color',c(4,:),'LineWidth',3)
plot(SIR(3,:),'Color',c(3,:),'LineWidth',3)
legend('Suceptible','Infected','Recovered','FontSize',16,'Interpreter','Latex','box','off','location','east')
labels('Time Steps','Number of Agents');
xlim([0 999]);
ylim([0 1199]);

