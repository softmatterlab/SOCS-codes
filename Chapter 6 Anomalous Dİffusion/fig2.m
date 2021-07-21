clear all; close all; clc; 

figure_pos = [0 0 1000 500];

axes_pos = [[70 80 400 400]; 
            [550 80 400 400]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));

load('figAD_1a.mat')
plot(x1/std(x1),'Color',c(2,:),'LineWidth',2)
plot(x2/std(x2),'Color',c(1,:),'LineWidth',2)
plot(x3/std(x3),'Color',c(4,:),'LineWidth',2)
labels('$t$ [steps]','$x$ [n.u]',22)
ylim([-8 8]);
x = x2;
legend({'SBM, $\alpha=0.5$','SBM, $\alpha=1$','SBM, $\alpha=2$'},'FontSize',15,'Interpreter','Latex')

axes(a(2));
load('figAD_1b.mat')


plot(x3/std(x3),'Color',c(2,:),'LineWidth',2)
plot(x/std(x),'Color',c(1,:),'LineWidth',2)
plot(x2/std(x2),'Color',c(4,:),'LineWidth',2)
labels('$t$ [steps]','$x$ [n.u]',22)
ylim([-8 8]);
legend({'CTRW, $\alpha=0.5$','SBM, $\alpha=1$','LW, $\alpha=2$'},'FontSize',15,'Interpreter','Latex')




