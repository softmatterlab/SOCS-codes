clear all; close all; clc; 

figure_pos = [0 0 850 460];

axes_pos = [[10 10 400 400]; 
            [440 10 400 400]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));
load('casimira.mat');

imagesc(S);
C = [c(4,:); c(1,:)];
colormap(C);
plot([20 40 40 20 20],[40 40 60 60 40],'k','LineWidth',3);
plot([20 40 40 20 20]+40,[40 40 60 60 40],'k','LineWidth',3);
title('Same affinity','Interpreter','latex','FontSize',22)
xlim([1 100]);
ylim([1 100]);
set(gca,'xTick',[],'yTick',[]);
fill([2 10 10 2 2]+1,100-[1 1 10 10 1]-1,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)

plot([0 1 0.7 1 0.7]*18+30,[0 0 0.1 0 -0.1]*22+50,'color',c(3,:),'LineWidth',5);
plot(-[0 1 0.7 1 0.7]*18+70,[0 0 0.1 0 -0.1]*22+50,'color',c(3,:),'LineWidth',5);

axes(a(2));
load('casimirb.mat');

imagesc(S);
C = [c(4,:); c(1,:)];
colormap(C);
plot([20 40 40 20 20],[40 40 60 60 40],'k','LineWidth',3);
plot([20 40 40 20 20]+40,[40 40 60 60 40],'k','LineWidth',3);
title('Opposite affinity','Interpreter','latex','FontSize',22)
xlim([1 100]);
ylim([1 100]);
set(gca,'xTick',[],'yTick',[]);
plot(-[0 1 0.7 1 0.7]*18+30,[0 0 0.1 0 -0.1]*22+50,'color',c(3,:),'LineWidth',5);
plot([0 1 0.7 1 0.7]*18+70,[0 0 0.1 0 -0.1]*22+50,'color',c(3,:),'LineWidth',5);
fill([2 10 10 2 2]+1,100-[1 1 10 10 1]-1,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)