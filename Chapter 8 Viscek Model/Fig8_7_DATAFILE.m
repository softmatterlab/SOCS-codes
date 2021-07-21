% script: Active Brownian Motion
% N independent particles (for statistics)
% in this script, all particles are identical

clear all;
close all;
clc;

fig_str = '_7_8';

Npart = 100;
eta = 40;
Rf=20;
Aref = pi*Rf^2;

d_list = [0 2 25];


%% fig 08 07
load(['datafile_' fig_str '.mat'],'x0','y0','x1','y1','d_list','closed_poly0','closed_poly1',...
    'Lx','Ly','c','phi','t','Npart',...
    'h','phi_dep','dphi_dep','c_dep','dc_dep');

cololines = [0 0 0]+0.75;
colodots = [0 0 0];

% plots 4 panels
% initial configuration
% final d=0
% final d=2
% final d=25

bx = 10;
by = 10;
xwi = 250;
ywi = xwi;

Xpix = 5*bx+4*xwi;
Ypix = 2*by+1*ywi;



figure('Position',[50 50 Xpix Ypix]);
% initial condition
axes('Position',[bx 0 xwi 0]/Xpix+[0 by 0 ywi]/Ypix);
hold on;
for j=1:Npart
     plot(closed_poly0{j}.x,closed_poly0{j}.y,'color',cololines);
end
plot(x0,y0,'.','color',colodots,'Markersize',10);
plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
hold off;
xlim(1.0*[-1 1]*Lx/2);
ylim(1.0*[-1 1]*Ly/2);
axis off;
drawnow;

% final condition d=0
for i=1:numel(d_list)
    axes('Position',[bx+i*(xwi+bx) 0 xwi 0]/Xpix+[0 by 0 ywi]/Ypix);
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


saveas(gcf,'ch08_fig07','fig');


%% Fig 8 8


bx1 = 60;
by1 = 60;
bx2 = 20;
by2 = 20;
xwi = 400;
ywi = 300;

Xpix = bx1+xwi+bx1+xwi+bx2;
Ypix = by1+ywi+by2;



figure('Position',[50 50 Xpix Ypix]);
% initial condition
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
errorbar(h,phi_dep,dphi_dep,'.k','Markersize',24,'Linewidth',2);
hold off;
box on;
xlabel('$h$ ','Interpreter','Latex','fontsize',20);
ylabel('$\psi$ ','Interpreter','Latex','fontsize',20);
xlim(h([1 end]));
ylim([0 1.1]);
drawnow;

axes('Position',[bx1+xwi+bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
errorbar(h,c_dep,dc_dep,'.k','Markersize',24,'Linewidth',2);
hold off;
box on;
xlabel('$h$ ','Interpreter','Latex','fontsize',20);
ylabel('$c$ ','Interpreter','Latex','fontsize',20);
xlim(h([1 end]));
ylim([0 1.1]);
drawnow;

saveas(gcf,'ch08_fig08','fig');


