clear all; close all; clc; 

figure_pos = [0 0 900 430];

axes_pos = [[80 220 400 200]; 
            [490 220 400 200];
            [80 10 400 200]; 
            [490 10 400 200]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_fig3.mat');

axes(a(1));
imagesc(flipud(data_matrix{1}));
xlim([0.5 61.5]);
ylim([0.5 32.5]);
fill([0 1 1 0 0]*4+2.2,32-0.9-[0 0 1 1 0]*5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
axis('off');



axes(a(2));
imagesc(flipud(data_matrix{2}));
xlim([0.5 61.5]);
ylim([0.5 32.5]);
fill([0 1 1 0 0]*4+2.3,32-0.9-[0 0 1 1 0]*5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
axis('off');



axes(a(3));
imagesc(flipud(data_matrix{3}));
xlim([0.5 61.5]);
ylim([0.5 32.5]);
fill([0 1 1 0 0]*4+2,32-0.9-[0 0 1 1 0]*5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
axis('off');


axes(a(4));
imagesc(flipud(data_matrix{4}));
C = [c(1,:)/2; c(4,:)+(1-c(4,:))*0.5];
colormap(C);
xlim([0.5 61.5]);
ylim([0.5 32.5]);
fill([0 1 1 0 0]*4+2.3,32-0.9-[0 0 1 1 0]*5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis('off');

axes('Units','Pixels','Position',[0 0 900 430]);
plot([60 60 55 60 65],[400 250 270 250 270],'k','LineWidth',3); hold on;
plot([60 60 55 60 65],[400 250 270 250 270]-210,'k','LineWidth',3);
text(30,360,'Time','FontSize',22,'Interpreter','Latex','Rotation',-90)
text(30,150,'Time','FontSize',22,'Interpreter','Latex','Rotation',-90)
xlim([0 930]);
ylim([0 430]);
axis('off');