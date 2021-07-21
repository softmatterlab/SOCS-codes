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




% simutype = 'expl';
simutype = 'impl';
simutype = 'xsympl';
% simutype = 'ysympl';

alpha = 2.0/3;
beta = 4.0/3;
gamma = 1;
delta = 1;




% other example less extreme

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


x0 = 1;
y0 = 1;

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

save([filepref '.mat'],'x','y','V','phi','t',...
    'x0','y0','dt','alpha','beta','gamma','delta','xeq','yeq','Tsim','Niter');



options_label = {'Interpreter','Latex','fontsize',16};

bx1 = 60;
bx2 = 20;
by1 = 60;
by2 = 20;
xwi = 300;
ywi = xwi;
xwi1 = 400;
Xpix = bx1+xwi+bx1+xwi+bx1+xwi1+bx2;
Ypix = by1+ywi+by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);

axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1+ywi+bx1 0 ywi]/Ypix);
hold on;
plot(t,x,'-','color',[0 0.5 0],'LineWidth',2);
plot(t,y,'-','color',[1 0.5 0],'LineWidth',2);
hold off;
box on;
legend('preys','predators','Location','NorthWest','fontsize',12);
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
ylim([0 2.5]);
drawnow;

axes('Position',[bx1+xwi+bx1 0 xwi 0]/Xpix+[0 by1+ywi+bx1 0 ywi]/Ypix);
hold on;
plot(t,V,'-','color',[0 0.5 1],'LineWidth',2);
plot(t,V(1)+0*t,'k--','LineWidth',2);
hold off;
box on;
xlabel('$t$',options_label{:});
ylabel('$I(t)$',options_label{:});
%title(str_simu,options_label{:})
ylim([0 3]);
drawnow;

axes('Position',[bx1+2*(xwi+bx1) 0 xwi 0]/Xpix+[0 by1+ywi+bx1 0 ywi]/Ypix);
hold on;
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels);
plot(x,y,'-','color',colo{1},options_line{:});
plot(x0,y0,'sk','MarkerFaceColor',colo{1},'Markersize',14);
plot(x(end),y(end),'ok','MarkerFaceColor',colo{1},'Markersize',14);
hold off;
colormap(white);
box on;
xlim([0, 2.5]);
ylim([0, 1.4]);
xlabel('Preys $x$',options_label{:});
ylabel('Predators $y$',options_label{:});
drawnow;



simutype = 'ysympl';
filepref = ['y_symplectic'];
str_simu = 'Symplectic Euler ($x$ explicit, $y$ implicit)';


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

save([filepref '.mat'],'x','y','V','phi','t',...
    'x0','y0','dt','alpha','beta','gamma','delta','xeq','yeq','Tsim','Niter');



options_label = {'Interpreter','Latex','fontsize',16};


axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t,x,'-','color',[0 0.5 0],'LineWidth',2);
plot(t,y,'-','color',[1 0.5 0],'LineWidth',2);
hold off;
box on;
legend('preys','predators','Location','NorthWest','fontsize',12);
xlabel('$t$',options_label{:});
ylabel('$N(t)$',options_label{:});
%title(str_simu,options_label{:});
ylim([0 2.5]);
drawnow;

axes('Position',[bx1+xwi+bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(t,V,'-','color',[0 0.5 1],'LineWidth',2);
plot(t,V(1)+0*t,'k--','LineWidth',2);
hold off;
box on;
xlabel('$t$',options_label{:});
ylabel('$I(t)$',options_label{:});
%title(str_simu,options_label{:})
ylim([0 3]);
drawnow;

axes('Position',[bx1+2*(xwi+bx1) 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels);
plot(x,y,'-','color',colo{1},options_line{:});
plot(x0,y0,'sk','MarkerFaceColor',colo{1},'Markersize',14);
plot(x(end),y(end),'ok','MarkerFaceColor',colo{1},'Markersize',14);
hold off;
colormap(white);
box on;
xlim([0, 2.5]);
ylim([0, 1.4]);
xlabel('Preys $x$',options_label{:});
ylabel('Predators $y$',options_label{:});
drawnow;






