clear all; close all; clc; 
figure_pos = [0 0 1000 310];

axes_pos = [[75 80 270 220]; 
            [425 80 270 220];
            [775 80 220 220]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



alpha = 2.0/3;
beta = 4.0/3;
gamma = 1;
delta = 1;
x0 = 1;
y0 = 1;
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
[Invariantl,Id_levelsl,xsl,ysl,xd_refl,yd_refl,dr_refl] = ...
    LV_invariant_linearized(alpha,beta,gamma,delta,xeq,yeq,x_list,y_list);
u0 = x0-xeq;
v0 = y0-yeq;
omega = sqrt(alpha*gamma);
A = sqrt(u0^2+(-omega*beta*gamma/delta*v0)^2);
phi = atan2(beta*gamma/delta*v0/A/omega,u0/A);
T0 = 2*pi/omega;
N = 100;
t_LIN = (0:1:Niter)*dt;
u = A*cos(omega*t_LIN+phi);
v = delta/(beta*gamma)*A*omega*sin(omega*t_LIN+phi);
x_LIN = u+xeq;
y_LIN = v+yeq;




axes(a(1));
plot(t_LIN,x_LIN,'-','color',[0 0.0 0]+0.4,'LineWidth',2);
plot(t_SX,x_SX,'-','color',cc(1,:),'LineWidth',2);
plot(t_SY,x_SY,'--','color',cc(2,:),'LineWidth',2);
legend('preys (Linearized)','preys (Symplectic X)','preys (Symplectic Y)','box','off','Interpreter','Latex','Location','Northeast','fontsize',12);
labels('$t$','$N(t)$')
ylim([0 2.8]);

axes(a(2))
plot(t_LIN,y_LIN,'-','color',[0 0.0 0]+0.75,'LineWidth',2);
plot(t_SX,y_SX,'-','color',cc(1,:),'LineWidth',2);
plot(t_SY,y_SY,'--','color',cc(2,:),'LineWidth',2);
legend('predators (Linearized)','predators (Symplectic X)','predators (Symplectic Y)','box','off','Interpreter','Latex','Location','Northeast','fontsize',12);
labels('$t$','$N(t)$')
ylim([0 2.8]);

axes(a(3))
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels,'color',[1 1 1]*0.8);
plot(x_LIN,y_LIN,'-','color',[0 0 0]+0.5,'LineWidth',3);
plot(x_SX,y_SX,'-','color',cc(1,:),'LineWidth',3);
plot(x_SY,y_SY,'-','color',cc(2,:),'LineWidth',3);
plot([0 1 1 0 0]*2.4,[0 0 1 1 0]*1.4,'k','Linewidth',0.2);
colormap(white);
xlim([0, 2.4]);
ylim([0, 1.4]);
labels('Preys $x$','Predators $y$');
