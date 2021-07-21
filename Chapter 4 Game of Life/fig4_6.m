clear all; close all; clc; 

figure_pos = [0 0 800 820];

axes_pos = [[55 530 240 240]; 
            [305 530 240 240];
            [555 530 240 240];
            [55 270 240 240]; 
            [305 270 240 240];
            [555 270 240 240];
            [55 10 240 240]; 
            [305 10 240 240];
            [555 10 240 240];];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_fig6.mat');


Nx = 6;
Ny = 6;

axes(a(1));
[x,y] = find(data_matrix{1,1});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
title('$t=0$','Interpreter','Latex','FontSize',22)
axis off;


axes(a(2));
[x,y] = find(data_matrix{2,1});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
title('$t=1$','Interpreter','Latex','FontSize',22)
set(gca,'Xtick',[],'Ytick',[]);
axis off;

axes(a(3));
[x,y] = find(data_matrix{1,1});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
title('$t=2$','Interpreter','Latex','FontSize',22)
set(gca,'Xtick',[],'Ytick',[]);
axis off;




axes(a(4));
[x,y] = find(data_matrix{1,2});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;


axes(a(5));
[x,y] = find(data_matrix{1,3});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;

axes(a(6));
[x,y] = find(data_matrix{1,2});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;




axes(a(7));
[x,y] = find(data_matrix{7,3});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;


axes(a(8));
[x,y] = find(data_matrix{4,3});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;

axes(a(9));
[x,y] = find(data_matrix{7,3});
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);

hb = plot(y,x,'o','color',c(1,:),'Markerfacecolor',...
    c(1,:),'Markersize',17);

fill([0 1 1 0 0]*0.65+0.7,5.5+[0 0 1 1 0]*0.9,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
set(gca,'Xtick',[],'Ytick',[]);
axis off;


axes('Units','Pixels','Position',[0 0 800 820]);
text(30,580,'The blinker','FontSize',22,'Interpreter','Latex','Rotation',90)
text(30,340,'The toad','FontSize',22,'Interpreter','Latex','Rotation',90)
text(30,60,'The beacon','FontSize',22,'Interpreter','Latex','Rotation',90)
xlim([0 800]);
ylim([0 820]);
axis('off');
