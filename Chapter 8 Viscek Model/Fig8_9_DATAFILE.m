% script: Active Brownian Motion
% N independent particles (for statistics)
% in this script, all particles are identical

clear all;
close all;
clc;

Npart = 100;
eta100 = 40;
Rf=20;
Aref = pi*Rf^2;

d_list = [0 2];


%% fig 09
load(['datafile_9.mat'],'x1','y1','d_list','closed_poly1',...
    'Lx','Ly','cf','psi','t','Npart');


cololines = [0 0 0]+0.75;
colodots = [0 0 0];

colo{1} = [0    0.5647    0.7020];
colo{3} = [0.2039    0.7059         0];
colo{2} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];


% plots 4 panels

bx = 10;
by = 10;
bx1 = 60;
by1 = 60;
xwi = 250;
ywi = xwi;

Xpix = 3*bx+4*xwi+2*bx1;
Ypix = by+1*ywi+by1;

figure('Position',[50 50 Xpix Ypix]);
% final condition
for i=1:2
    axes('Position',[bx+(i-1)*(xwi+bx) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
    hold on;
    for j=1:Npart
        plot(closed_poly1{i,j}.x,closed_poly1{i,j}.y,'color',cololines);
    end
    plot(x1{i},y1{i},'.','color',colodots,'Markersize',10);
    plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
    hold off;
    xlim(1.0*[-1 1]*Lx/2);
    ylim(1.0*[-1 1]*Ly/2);
    axis off;
    drawnow;
end


% phi
axes('Position',[(bx+xwi+bx+xwi+bx1) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
for i=1:2   
    plot(t{i}-1,psi{i}(t{i}),'color',colo{i});
end
hold off;
xlim(t{1}([1 end])-1);
ylim([0 1.1]);
box on;
xlabel('$t$','Interpreter','Latex','fontsize',14);
ylabel('$\psi$','Interpreter','Latex','fontsize',14);
drawnow;


% c
axes('Position',[(bx+xwi+bx+xwi+bx1)+(xwi+bx1) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
for i=1:2   
    plot(t{i}-1,cf{i}(t{i}),'color',colo{i});
end
hold off;
box on;
xlim(t{i}([1 end])-1);
ylim([0 1.1]);
xlabel('$t$','Interpreter','Latex','fontsize',14);
ylabel('$c$','Interpreter','Latex','fontsize',14);
drawnow;

saveas(gcf,'ch08_fig9','fig');


