clear all; close all; clc; 

figure_pos = [0 0 950 660];

axes_pos = [[5 310 280 280]; 
            [325 310 280 280];
            [650 310 280 280];
            [5 10 280 280]; 
            [325 10 280 280];
            [650 10 280 280]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_fig9.mat');



for i=1:2
    for j=1:3
        axes(a((i-1)*3+j));
        S = data_matrix{j,i};
        imagesc(S);
        C = [[1 1 1]; c(1,:)];
        colormap(C);
        xlim([0.5 120.5]);
        ylim([0.5 120.5]);
        if i==1
            title(['$p=' num2str((j-1)*0.1+0.4) '$'],'Interpreter','Latex','FontSize',22)
        end
        fill([0 1 1 0 0]*14+4,102+[0 0 1 1 0]*16,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
        axis('off');
    end
end


% axes('Units','Pixels','Position',[0 0 900 660]);
% text(30,580,'The blinker','FontSize',22,'Interpreter','Latex','Rotation',90)
% text(30,340,'The toad','FontSize',22,'Interpreter','Latex','Rotation',90)
% text(30,60,'The beacon','FontSize',22,'Interpreter','Latex','Rotation',90)
% xlim([0 800]);
% ylim([0 820]);
% axis('off');