clear all; close all; clc; 
figure_pos = [0 0 1000 340];

axes_pos = [[80 80 250 250]; 
            [410 80 250 250];
            [740 80 250 250]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

simutype = 'expl';
% simutype = 'impl';
% simutype = 'xsympl';
% simutype = 'ysympl';
alpha = 2.0/3;
beta = 4.0/3;
gamma = 1;
delta = 1;
%list_init_cond = 0.9:0.1:1.8;
list_init_cond = 1.0;
options_line = {'LineWidth',2};

if strcmpi(simutype,'expl')
    filepref = ['explicit'];
    str_simu = 'Explicit Euler';
end
if strcmpi(simutype,'impl')
    filepref = ['implicit'];
    str_simu = 'Implicit Euler';
end
if strcmpi(simutype,'xsympl')
    filepref = ['x_symplectic'];
    str_simu = 'Symplectic Euler ($x$ implicit, $y$ explicit)';
end
if strcmpi(simutype,'ysympl')
    filepref = ['y_symplectic'];
    str_simu = 'Symplectic Euler ($x$ explicit, $y$ implicit)';
end

x0 = list_init_cond;
y0 = list_init_cond;

alpha = 2.0/3;
beta = 4.0/3;
gamma = 1;
delta = 1;

[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant_1(alpha,beta,gamma,delta);


% xeq = gamma/delta;
% yeq = alpha/beta;


dt = 0.05;
Tsim = 20;
Niter = round(Tsim/dt);

if strcmpi(simutype,'expl')
    [x,y,V0,V] = volterra_lotka(x0,y0,dt,Niter,alpha,beta,gamma,delta);
end
if strcmpi(simutype,'impl')
    [x,y,V0,V] = volterra_lotka_implicit_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta);
end
if strcmpi(simutype,'xsympl')
    [x,y,V0,V] = volterra_lotka_symplectic_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta,'x');
end
if strcmpi(simutype,'ysympl')
    [x,y,V0,V] = volterra_lotka_symplectic_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta,'y');
end

phi = atan2(y-yeq,x-xeq);    
t = (0:1:Niter)*dt;
[T] = estimate_periodicity(phi,t);



axes(a(1));
plot(t,x,'-','color',[0 0.5 0],'LineWidth',2);
plot(t,y,'-','color',[1 0.5 0],'LineWidth',2);
legend('preys','predators','Location','Northeast','box','off','Interpreter','latex','fontsize',14);
labels('$t$','$N(t)$');
ylim([0 2.8]);

axes(a(2));
plot(t,V,'-','color',[0 0.5 1],'LineWidth',2);
plot(t,V(1)+0*t,'k--','LineWidth',2);
labels('$t$','$I(t)$');
ylim([0 3.9]);

axes(a(3));
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels,'color',[0.8 0.8 0.8]);
plot(x,y,'-','color',cc(1,:),'LineWidth',2);
plot(x0,y0,'sk','MarkerFaceColor',cc(1,:),'Markersize',10);
plot(x(end),y(end),'ok','MarkerFaceColor',cc(1,:),'Markersize',10);
colormap(white);
plot([0 2.3 2.3 0 0],[0 0 1.4 1.4 0],'k','Linewidth',0.2);
xlim([0, 2.3]);
ylim([0, 1.4]);
labels('Preys $x$','Predators $y$')
set(gca,'xTick',0:0.5:2)




