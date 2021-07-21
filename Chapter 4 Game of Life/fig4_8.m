clear all; close all; clc; 

figure_pos = [0 0 800 660];

axes_pos = [[20 10 240 600]; 
            [280 10 240 600];
            [540 10 240 600]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_fig8.mat');


Nx = 16;
Ny = 40;


for i=1:3

    axes(a(i));
    [x,y] = find(data_matrix{i});
    for ir = 0:Ny
        plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
    end
    for ic = 0:Nx
        plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
    end
    xlim([1, Nx]+0.6*[-1 1]);
    ylim([1, Ny]+0.6*[-1 1]);

    hb = plot(x,y,'o','color',c(1,:),'Markerfacecolor',...
        c(1,:),'Markersize',7);
    if i==3
        x = [11,12,12,13,13];
        y = [15,14,13,15,14];
        hb = plot(x,y,'o','color',c(3,:),'Markerfacecolor',...
        c(3,:),'Markersize',7);
    end

    fill([0 1 1 0 0]*1.6+1.2,37.9+[0 0 1 1 0]*2.2,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
    %set(gca,'Xtick',[],'Ytick',[]);
    title(['$t=' int2str((i-1)*15) '$'],'Interpreter','Latex','FontSize',22)
    axis off;
    
end
