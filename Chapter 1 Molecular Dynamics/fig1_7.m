clear all; close all; clc; 

figure_pos = [0 0 1000 700];

axes_pos = [[50 80 500 500]; 
            [650 420 340 160];
            [650 250 340 160];
            [650 80 340 160]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end





axes(a(1));





%% Data
load('simulation_3e4.mat','t_int',...'dt','x','y','vx','vy','Lx','Ly','Bx','By',...
    'Niter','sigma','m','epsilon','t0','v0',...
    'T0','K','E','U','T'...,...
    ...'sigma_Ar','m_Ar','epsilon_Ar','t0_Ar','v0_Ar','T0_Ar','T_Ar','K_Ar','E_Ar','U_Ar','t_int_Ar',...
    ...'T_in_Ar','T_av_Ar','kBT','T_Ar_fit1','delta_T_Ar1','T_Ar_fit2','delta_T_Ar2'...
    );
Niter
T_01 = T/T0;
K_01 = K/epsilon;
E_01 = E/epsilon;
U_01 = U/epsilon;
% initial values
Ti_01 = T_01(1);
Ki_01 = K_01(1);
Ei_01 = E_01(1);
Ui_01 = U_01(1);
% variation
dT_01 = T_01-T_01(1);
dK_01 = K_01-K_01(1);
dE_01 = E_01-E_01(1);
dU_01 = U_01-U_01(1);
%
t_01 = t_int;

% delta t = 0.001 t0
load('simulation_3e5.mat','t_int',...'dt','x','y','vx','vy','Lx','Ly','Bx','By',...
    'Niter','sigma','m','epsilon','t0','v0',...
    'T0','K','E','U','T'...,...
    ...'sigma_Ar','m_Ar','epsilon_Ar','t0_Ar','v0_Ar','T0_Ar','T_Ar','K_Ar','E_Ar','U_Ar','t_int_Ar',...
    ...'T_in_Ar','T_av_Ar','kBT','T_Ar_fit1','delta_T_Ar1','T_Ar_fit2','delta_T_Ar2'...
    );
Niter
T_001 = T/T0;
K_001 = K/epsilon;
E_001 = E/epsilon;
U_001 = U/epsilon;
% initial values
Ti_001 = T_001(1);
Ki_001 = K_001(1);
Ei_001 = E_001(1);
Ui_001 = U_001(1);
% variation
dT_001 = T_001-T_001(1);
dK_001 = K_001-K_001(1);
dE_001 = E_001-E_001(1);
dU_001 = U_001-U_001(1);
%
t_001 = t_int;
%%
axes(a(2));
set(gca,'fontname','times','FontSize',14)  % Set it to times

plot(t_001(1:1000:end),dK_001(1:1000:end),'Linewidth',1,'color',c(3,:));
plot(t_01(1:100:end),dK_01(1:100:end),'Linewidth',1,'color',c(1,:));
plot(t_01([1 end]),[0 0],'k--','Linewidth',2);
% text(10,-21,'Kinetic Energy $K(t)-K(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
text(100,147,'\bf Kinetic Energy','Units','Pixels','FontSize',14);
ylabel('$\Delta K(t)$ [$\epsilon$]','Interpreter','Latex','Fontsize',22);
% xlabel('$t$ $[t_0]$','Interpreter','Latex','Fontsize',22);
ylim([-1 1]*9+1);
xlim([0 299]);
set(gca,'xTick',[],'yTick',[-5 0 5]);




axes(a(3))
set(gca,'fontname','times','FontSize',14)  % Set it to times

plot(t_001(1:1000:end),dU_001(1:1000:end),'Linewidth',1,'color',c(3,:));
plot(t_01(1:100:end),dU_01(1:100:end),'Linewidth',1,'color',c(1,:));
plot(t_01([1 end]),[0 0],'k--','Linewidth',2);
% text(10,-2.1,'Potential Energy $U_{\rm tot}(t)-U_{\rm tot}(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
text(95,140,'\bf Potential Energy','Units','Pixels','FontSize',14);
% ylabel('Energy [$\epsilon$]','Interpreter','Latex','Fontsize',22);
% xlabel('$t$ $[t_0]$','Interpreter','Latex','Fontsize',22);
ylim([-1 1]*9+1);
xlim([0 299]);
set(gca,'xTick',[],'yTick',[-5 0 5]);
ylabel('$\Delta U(t)$ [$\epsilon$]','Interpreter','Latex','Fontsize',22);


axes(a(4))
set(gca,'fontname','times','FontSize',14)  % Set it to times

plot(t_001(1:100:end),dE_001(1:100:end),'Linewidth',2,'color',c(3,:));
plot(t_01(1:10:end),dE_01(1:10:end),'Linewidth',2,'color',c(1,:));
plot(t_01([1 end]),[0 0],'k--','Linewidth',2);
% text(10,-2.1,'Potential Energy $U_{\rm tot}(t)-U_{\rm tot}(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
text(110,140,'\bf Total Energy','Units','Pixels','FontSize',14);
ylabel('$\Delta E(t)$ [$\epsilon$]','Interpreter','Latex','Fontsize',22);
xlabel('$t$ $[t_0]$','Interpreter','Latex','Fontsize',22);
set(gca,'yTick',[-5 0 5]);
ylim([-1 1]*9+1);
xlim([0 299]);
legend({'$\Delta t = 0.001 t_0$','$\Delta t = 0.01 t_0$'},'Interpreter','latex','Fontsize',14,'box','off','location','southeast')


%%
axes(a(1));
set(gca,'Ydir','reverse');
thetaang = (0:1:360)*pi/180;
prop_arrow = {'StemWidth',2*[0.0250],'HeadWidth',2*[0.1000],'HeadLength',2*[0.1500],'HeadNode',2*[0.1000]};

load('simulation_3e4.mat','t_int','x','y','vx','vy','Lx','Ly','Bx','By');
% i is berween 1 and 30001
i = 890;
i = 1800;
Npart = size(x,2);
hold on;
lenplottraj = 200;
if i>lenplottraj
    interv = i+1+(-(lenplottraj-1):1:0);
else
    interv = 1:(i+1);
end
%plot(x(i+1,:),y(i+1,:),'.r','Markersize',10);
for j=1:Npart
    plot(x(interv,j),y(interv,j),'k');
end
for j=1:Npart
    fill(x(i+1,j)+0.5*sigma*cos(thetaang),y(i+1,j)+0.5*sigma*sin(thetaang),[0.4 0.6 1],'EdgeColor','k');
end
% arrows
mf = 1;
for j=1:Npart
    arroww2d(x(i+1,j),y(i+1,j),...
        x(i+1,j)+mf*vx(i+1,j),y(i+1,j)+mf*vy(i+1,j),prop_arrow{:}...
        ...,'FaceAlpha',0.4,'EdgeAlpha',0.4);
        );
end
plot([0 1 1 0 0]*Lx+[-1 1 1 -1 -1]*Bx,[0 0 1 1 0]*Ly+[-1 -1 1 1 -1 ]*By,'k');
hold off;
drawnow;
% axis off;
xlabel('$x$','Interpreter','Latex','Fontsize',22);
ylabel('$y$','Interpreter','Latex','Fontsize',22);
set(gca,'xtick',[],'ytick',[]);
xlim([0 1]*Lx+[-1 1]*(Bx+0.1));
ylim([0 1]*Ly+[-1 1]*(By+0.1));