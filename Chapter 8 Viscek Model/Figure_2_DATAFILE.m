clear all;
close all;
clc;


load('data_figure_2.mat','x','y','L','i0','xreplicas','yreplicas','Rflocking');


thetaang = (0:1:360)*pi/180;



bx = 20;
by = 20;
xwi = 300;
ywi = xwi;

Xpix = 3*bx+2*xwi;
Ypix = 2*by+1*ywi;



figure('Position',[50 50 Xpix Ypix]);


% part with the central domain and the 8 replicas
axes('Position',[bx 0 xwi 0]/Xpix+[0 by 0 ywi]/Ypix);
hold on;
fill(x(i0)+Rflocking*cos(thetaang),y(i0)+Rflocking*sin(thetaang),[0 0 0]+0.75,'Edgecolor','none');
plot(x,y,'.','color','k','MarkerSize',10);
plot(xreplicas,yreplicas,'.','color',[0 0 0]+0.5,'MarkerSize',10);
plot(x(i0),y(i0),'.','color','r','MarkerSize',20,'MarkerFaceColor','r');
% lines to highlight the periodicity
plot(3*[-1 1]*L/2,-L/2+[0 0],'k--');
plot(3*[-1 1]*L/2,L/2+[0 0],'k--');
plot(-L/2+[0 0],3*[-1 1]*L/2,'k--');
plot( L/2+[0 0],3*[-1 1]*L/2,'k--');
hold off;
xlim(3*[-1 1]*L/2);
ylim(3*[-1 1]*L/2);
set(gca,'Xtick',[],'Ytick',[]);
box on;
drawnow;

% part with the central domain only, area of interaction is folded
axes('Position',[bx+(xwi+bx) 0 xwi 0]/Xpix+[0 by 0 ywi]/Ypix);
hold on;
for i=(-1:1)
    for j=(-1:1)
        fill(x(i0)+i*L+Rflocking*cos(thetaang),y(i0)+j*L+Rflocking*sin(thetaang),[0 0 0]+0.75,'Edgecolor','none');
    end
end
plot(x,y,'.','color','k','MarkerSize',10);
plot(x(i0),y(i0),'.','color','r','MarkerSize',20,'MarkerFaceColor','r');
hold off;
xlim([-1 1]*L/2);
ylim([-1 1]*L/2);
set(gca,'Xtick',[],'Ytick',[]);
box on;
drawnow;



