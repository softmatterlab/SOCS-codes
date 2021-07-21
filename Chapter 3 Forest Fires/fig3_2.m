clear all; close all; clc; 

figure_pos = [0 0 1000 340];

axes_pos = [[10 10 310 310]; 
            [340 10 310 310];
            [670 10 310 310]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

mf = 2.5;
size_tree = mf*4;
size_fire = mf*4;
size_lightning = mf*4;


axes(a(2));
fill([-1 1 1 -1 -1]+2, [-1 -1 1 1 -1],c(3,:))
fill([-1 1 1 -1 -1], [-1 -1 1 1 -1]+2,c(3,:))
plot([-1 1 1 -1 -1],[-3 -3 3 3 -3],'k','LineWidth',2)
plot([-3 -3 3 3 -3],[-1 1 1 -1 -1],'k','LineWidth',2)
hw = plot([0 2 0],[0 0 2],'^','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',size_tree*4);
hw = plot([0 2 0],[0 0 2]-0.6,'s','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',size_tree*1.6);
hw = plot(0,0,'^','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',size_tree*4);
hw = plot(0,-0.6,'s','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',size_tree*1.6);




xlim([-3.5 3.5]);
ylim([-3.5 3.5]);
axis('off');

axes(a(3));

load(['iteration_192.mat'],...
    'xc','yc','xb','yb','xl0','yl0','Nx','Ny');


xc = xc([1:118 121:end]);
yc = yc([1:118 121:end]);
xb = xb([1:70 73]);
yb = yb([1:70 73]);

fill(xl0+[-1 -1 1 1 -1]*0.5,yl0+[1 -1 -1 1 1]*0.5,c(4,:));
% plot lattice lines
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hw = plot(xc,yc,'^','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',8);
hw = plot(xc,yc-0.3,'s','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',4);
hw = plot(xb,yb,'^','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',8);
hw = plot(xb,yb-0.3,'s','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',4);
%hle = plot(posl(i,1),posl(i,2),'v','color',color_lightning,...
%    'Markerfacecolor',color_lightning,'Markersize',size_lightning);
fill([3 10 10 3 3]/5+0.4,16.1-[-1 -1 8 8 -1]/5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
set(gca,'Xtick',[],'Ytick',[]);

axis('off');
xlim([1, Nx]+0.5*[-1 1]);
ylim([1, Ny]+0.5*[-1 1]);



axes(a(1));

fill(xl0+[-1 -1 1 1 -1]*0.5,yl0+[1 -1 -1 1 1]*0.5,c(4,:));
% plot lattice lines
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hw = plot(xc,yc,'^','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',8);
hw = plot(xc,yc-0.3,'s','color',c(2,:),'Markerfacecolor',...
    c(2,:),'Markersize',4);
hb = plot(xl0,yl0,'^','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',8);
hb = plot(xl0,yl0-0.3,'s','color',c(3,:),'Markerfacecolor',...
    c(3,:),'Markersize',4);
%hle = plot(posl(i,1),posl(i,2),'v','color',color_lightning,...
%    'Markerfacecolor',color_lightning,'Markersize',size_lightning);
fill([3 10 10 3 3]/5+0.4,16.1-[-1 -1 8 8 -1]/5,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
set(gca,'Xtick',[],'Ytick',[]);

xlim([1, Nx]+0.5*[-1 1]);
ylim([1, Ny]+0.5*[-1 1]);