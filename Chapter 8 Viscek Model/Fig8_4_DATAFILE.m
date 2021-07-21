% script: Active Brownian Motion
% N independent particles (for statistics)
% in this script, all particles are identical

clear all;
close all;
clc;

Npart = 100;
eta100 = 40;
Rf=1;
file_str = ['N' num2str(Npart) '_eta' num2str(eta100) '_flockR' num2str(Rf)];

load(['datafile_' file_str '.mat'],'x0','y0','x1','y1','closed_poly0','closed_poly1','Lx','Ly','c','phi','t','Npart');

cololines = [0 0 0]+0.75;
colodots = [0 0 0];

% plots 4 panels
% initial configuration
% final d=0
% final d=2
% final d=25

bx = 10;
by = 10;
bx1 = 60;
by1 = 60;
xwi = 250;
ywi = xwi;

Xpix = 3*bx+4*xwi+2*bx1;
Ypix = by+1*ywi+by1;

tc = 1:numel(phi);

figure('Position',[50 50 Xpix Ypix]);
% initial condition
axes('Position',[bx 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
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

% final condition
axes('Position',[bx+(xwi+bx) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
for j=1:Npart
    plot(closed_poly1{j}.x,closed_poly1{j}.y,'color',cololines);
end
plot(x1,y1,'.','color',colodots,'Markersize',10);
plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
hold off;
xlim(1.0*[-1 1]*Lx/2);
ylim(1.0*[-1 1]*Ly/2);
axis off;
drawnow;


% phi
axes('Position',[bx+xwi+bx+xwi+bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t-1,phi(t),'b');
hold off;
xlim(t([1 end])-1);
ylim([0 1.1]);
box on;
xlabel('$t$','Interpreter','Latex','fontsize',14);
ylabel('$\psi$','Interpreter','Latex','fontsize',14);
drawnow;


% c
axes('Position',[bx+xwi+bx+xwi+bx1+xwi+bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t-1,c(t),'b');
hold off;
box on;
xlim(t([1 end])-1);
ylim([0 1.1]);
xlabel('$t$','Interpreter','Latex','fontsize',14);
ylabel('$c$','Interpreter','Latex','fontsize',14);
drawnow;

saveas(gcf,'ch08_fig4','fig');


