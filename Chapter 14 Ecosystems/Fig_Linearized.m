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

alpha = 2.0/3.0;
beta = 4.0/3.0;
gamma = 1;
delta = 1;


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
xwi1 = 400;
Xpix = bx1+xwi+bx1+xwi+bx1+xwi1+bx2;
Ypix = by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);

optionslabel = {'Interpreter','Latex','fontsize',20};

[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant_0(alpha,beta,gamma,delta);

ah1 = axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels);
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
hold off;
box on;
xlim(x_list([1 end])+0.5*dr*[-1 1]);
ylim(y_list([1 end])+0.5*dr*[-1 1]);
xlabel('$x$',optionslabel{:});
ylabel('$y$',optionslabel{:});
colormap(white);


[Invariantl,Id_levelsl,xsl,ysl,xd_refl,yd_refl,dr_refl] = ...
    LV_invariant_linearized(alpha,beta,gamma,delta,xeq,yeq,x_list,y_list);

u0 = 1.62-xeq;
v0 = 0.47-yeq;
omega = sqrt(alpha*gamma);
A = sqrt(u0^2+(-omega*beta*gamma/delta*v0)^2);
phi = atan2(beta*gamma/delta*v0/A/omega,u0/A);

T0 = 2*pi/omega;

N = 100;
t = (0:(4*N))/N*T0;
u = A*cos(omega*t+phi);
v = delta/(beta*gamma)*A*omega*sin(omega*t+phi);


ah2 = axes('Position',[bx1+xwi+bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
[Mn,cn] = contourf(xeq+xsl,yeq+ysl,Invariantl,Id_levelsl);
plot(x_list([1 end])+dr*[-1 1],[0 0]+yeq,'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
plot(xeq+u,yeq+v,'color',colo{2},'Linewidth',2);
hold off;
xlabel('$x$',optionslabel{:});
ylabel('$y$',optionslabel{:});
colormap(white);
box on;



ah3 = axes('Position',[bx1+xwi+bx1+xwi+bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t,u+xeq,'color',colo{1},'Linewidth',1);
plot(t,v+yeq,'color',colo{3},'Linewidth',1);
hold off;
xlabel('$t$',optionslabel{:});
ylabel('$x(t)$, $y(t)$',optionslabel{:});
colormap(white);
box on;
legend('x','y');
xlim([0 30]);



