% script: Active Brownian Motion
% N independent particles (for statistics)
% in this script, all particles are identical

clear all;
close all;
clc;


simutype = 'expl';
simutype = 'impl';
simutype = 'xsympl';
simutype = 'ysympl';

% alpha = 2e-4;
% beta = 1e-6;
% gamma = 1e-7;
% delta = 2e-5;

% example 1 baboon and cheetah
x0 = 10;
y0 = 10;
alpha = 1.1;
beta = 0.4;
gamma = 1.1;
delta = 0.4;


%
dt=1; Niter = 3;

dx_list = -3:0.01:3;
dy_list = -3:0.01:3;
%[discr] = LV_discr_lin_sign(alpha,beta,gamma,delta,dx_list,dy_list);






bx1 = 60;
bx2 = 20;
by1 = 60;
by2 = 20;
xwi = 300;
ywi = xwi;
Xpix = bx1+xwi+bx2+xwi+bx2;
Ypix = by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);

optionslabel = {'Interpreter','Latex','fontsize',20};

[xs,ys,vx,vy,xeq,yeq,dr,x_list,y_list] = LV_vector_field(alpha,beta,gamma,delta);

ah1 = axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
quiver(xs,ys,vx,vy,'Linewidth',2);
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
hold off;
box on;
xlim(x_list([1 end])+0.5*dr*[-1 1]);
ylim(y_list([1 end])+0.5*dr*[-1 1]);
xlabel('$x$',optionslabel{:});
ylabel('$y$',optionslabel{:});


[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant(alpha,beta,gamma,delta);

ah2 = axes('Position',[bx1+xwi+bx2 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels);
figure(gcf);
hold on;
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
xlabel('$x$',optionslabel{:});
%ylabel('$y$',optionslabel{:});
colormap(white);




