clear all; close all; clc; 

figure_pos = [0 0 1000 210];

axes_pos = [[5 10 190 190]; 
            [205 10 190 190];
            [405 10 190 190]; 
            [605 10 190 190];
            [805 10 190 190]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_fig7.mat');


Nx = 6;
Ny = 6;

for i=1:5
    axes(a(i));
    [x,y] = find(data_matrix{i});
    for ir = 0:Nx
        plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
    end
    for ic = 0:Ny
        plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
    end
    xlim([1, Nx]+0.6*[-1 1]);
    ylim([1, Ny]+0.6*[-1 1]);

    hb = plot(y+1,x-1,'o','color',c(1,:),'Markerfacecolor',...
        c(1,:),'Markersize',17);

    fill([0 1 1 0 0]*0.9+0.75,5.3+[0 0 1 1 0]*1.1,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
    %set(gca,'Xtick',[],'Ytick',[]);
    title(['$t=' int2str(i-1) '$'],'Interpreter','Latex','FontSize',22)
    axis off;
end
