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


alpha = 2.0/3;
beta = 4.0/3;
gamma = 1;
delta = 1;

x0 = 1;
y0 = 1;

options_line = {'LineWidth',2};


simutype = 'xsympl';
filepref = ['x_symplectic'];
str_simu = 'Symplectic Euler ($x$ implicit, $y$ explicit)';

[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant_1(alpha,beta,gamma,delta);

dt = 0.05;
Tsim = 50;
Niter = round(Tsim/dt);

[x_SX,y_SX,V0_SX,V_SX] = volterra_lotka_symplectic_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta,'x');

phi_SX = atan2(y_SX-yeq,x_SX-xeq);
t_SX = (0:1:Niter)*dt;
[T_SX] = estimate_periodicity(phi_SX,t_SX);


simutype = 'ysympl';
filepref = ['y_symplectic'];
str_simu = 'Symplectic Euler ($x$ explicit, $y$ implicit)';


[x_SY,y_SY,V0_SY,V_SY] = volterra_lotka_symplectic_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta,'y');
phi_SY = atan2(y_SY-yeq,x_SY-xeq);
t_SY = (0:1:Niter)*dt;
[T_SY] = estimate_periodicity(phi_SY,t_SY);



% linearized

[Invariantl,Id_levelsl,xsl,ysl,xd_refl,yd_refl,dr_refl] = ...
    LV_invariant_linearized(alpha,beta,gamma,delta,xeq,yeq,x_list,y_list);


u0 = x0-xeq;
v0 = y0-yeq;
omega = sqrt(alpha*gamma);
A = sqrt(u0^2+(-omega*beta*gamma/delta*v0)^2);
phi = atan2(beta*gamma/delta*v0/A/omega,u0/A);

T0 = 2*pi/omega;

N = 100;
%t = (0:(4*N))/N*T0;
t_LIN = (0:1:Niter)*dt;
u = A*cos(omega*t_LIN+phi);
v = delta/(beta*gamma)*A*omega*sin(omega*t_LIN+phi);
x_LIN = u+xeq;
y_LIN = v+yeq;


options_label = {'Interpreter','Latex','fontsize',16};

bx1 = 60;
bx2 = 20;
by1 = 60;
by2 = 20;
xwi = 300;
ywi = xwi;
xwi1 = 400;
Xpix = bx1+xwi+bx1+xwi1+bx1+xwi1+bx2;
Ypix = by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);

axes('Position',[bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t_LIN,x_LIN,'-','color',[0 0.0 0]+0.4,'LineWidth',2);
plot(t_SX,x_SX,'-','color',colo{1},'LineWidth',2);
plot(t_SY,x_SY,'-','color',colo{2},'LineWidth',2);
hold off;
box on;
legend('preys (Linearized)','preys (Symplectic X)','preys (Symplectic Y)','Location','NorthWest','fontsize',12);
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
ylim([0 2.5]);
drawnow;

axes('Position',[bx1+xwi1+bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t_LIN,y_LIN,'-','color',[0 0.0 0]+0.75,'LineWidth',2);
plot(t_SX,y_SX,'-','color',colo{3},'LineWidth',2);
plot(t_SY,y_SY,'-','color',colo{4},'LineWidth',2);
hold off;
box on;
legend('predators (Linearized)','predators (Symplectic X)','predators (Symplectic Y)','Location','NorthWest','fontsize',12);
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
ylim([0 2.5]);
drawnow;


axes('Position',[bx1+2*(xwi1+bx1) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels);
plot(x_LIN,y_LIN,'-','color',[0 0 0]+0.5,'LineWidth',3);
plot(x_SX,y_SX,'-','color',colo{1},'LineWidth',3);
plot(x_SY,y_SY,'-','color',colo{3},'LineWidth',3);
hold off;
colormap(white);
box on;
xlim([0, 2.5]);
ylim([0, 1.4]);
xlabel('Preys $x$',options_label{:});
ylabel('Predators $y$',options_label{:});
drawnow;






