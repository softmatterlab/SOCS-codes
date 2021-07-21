% script: Active Brownian Motion
% N independent particles (for statistics)
% in this script, all particles are identical

clear all;
close all;
clc;

colo{1} = [0    0.5647    0.7020];
colo{2} = [0.2039    0.7059         0];
colo{3} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];


r = 0.1;
K = 2;

x0 = 0.1;

options_line = {'LineWidth',2};


dt = 0.05;
Tsim = 100;
Niter = round(Tsim/dt);
[x,t,alpha] = logistic(x0,dt,Niter,r,K);


dt1 = 5;
Niter1 = round(Tsim/dt1);
[x1,t1,alpha] = logistic(x0,dt1,Niter1,r,K);


t0=0;
[x_an,t_an,alpha_an] = logistic_analytical(x0,dt,Niter,r,K,t0);


options_label = {'Interpreter','Latex','fontsize',16};

bx1 = 60;
bx2 = 20;
by1 = 60;
by2 = 20;
xwi = 300;
ywi = xwi;
xwi1 = 400;
Xpix = bx1+xwi1+bx1+xwi1+bx2;
Ypix = by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);

axes('Position',[bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t,x,'-','color',colo{1});
plot(t1,x1,'.','color',colo{2},'MarkerSize',10);
hold off;
box on;
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
drawnow;


axes('Position',[bx1+xwi1+bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t_an,x_an,'-','color',[0 0 0]+0.5,'LineWidth',2);
hold off;
box on;
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
drawnow;





