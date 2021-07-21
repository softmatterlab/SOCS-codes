clear all; close all; clc; 

figure_pos = [0 0 1000 310];

axes_pos = [[75 80 220 220]; 
            [370 80 220 220];
            [670 80 325 220]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


simutype = 'expl';
simutype = 'impl';
simutype = 'xsympl';
simutype = 'ysympl';
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
dt=1; Niter = 3;
dx_list = -3:0.01:3;
dy_list = -3:0.01:3;
[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant_0(alpha,beta,gamma,delta);

axes(a(1));
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels,'color',cc(1,:));
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
xlim(x_list([1 end])+0.5*dr*[-1 1]);
ylim(y_list([1 end])+0.5*dr*[-1 1]);
labels('$x$','$y$')
colormap(white);



axes(a(2));
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
[Mn,cn] = contourf(xeq+xsl,yeq+ysl,Invariantl,Id_levelsl,'color',cc(1,:));
plot(x_list([1 end])+dr*[-1 1],[0 0]+yeq,'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
plot(xeq+u,yeq+v,'color',cc(4,:),'Linewidth',2);
labels('$x$','$y$')
colormap(white);


axes(a(3));
plot(t,u+xeq,'color',cc(1,:),'Linewidth',2);
plot(t,v+yeq,'color',cc(2,:),'Linewidth',2);
labels('$t$','$x(t)$, $y(t)$')
colormap(white);
legend('$x$','$y$','Fontsize',16,'Interpreter','latex','box','off','location','northeast');
xlim([0 29.99]);
ylim([0 2.4]);

