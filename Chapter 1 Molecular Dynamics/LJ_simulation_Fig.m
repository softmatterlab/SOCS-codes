clear all;
close all;
clc;










% here other panels

% delta t = 0.01 t0
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

% dTi_001_av = mean(reshape(dTi_001(1:Niter),10,Niter/10),1)';
% dKi_001_av = mean(reshape(dKi_001(1:Niter),10,Niter/10),1)';
% dEi_001_av = mean(reshape(dEi_001(1:Niter),10,Niter/10),1)';
% dUi_001_av = mean(reshape(dUi_001(1:Niter),10,Niter/10),1)';
% t_001_av = mean(reshape(t_001(1:Niter),10,Niter/10),1)';


prop_arrow = {'StemWidth',2*[0.0250],'HeadWidth',2*[0.1000],'HeadLength',2*[0.1500],'HeadNode',2*[0.1000]};

options_label = {'Interpreter','Latex','Fontsize',16};

%% screenshot position velocities

bx1 = 20;
bx2 = 20;
by1 = 20;
by2 = 20;

xwi = 300;
ywi = 300;

Xpix = bx1+xwi+bx2;
Ypix = by1+ywi+by2;

thetaang = (0:1:360)*pi/180;

figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix + [0 by1 0 ywi]/Ypix);
set(gca,'Ytick',[]);
set(gca,'Xtick',[]);
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
    arrow2d(x(i+1,j),y(i+1,j),...
        x(i+1,j)+mf*vx(i+1,j),y(i+1,j)+mf*vy(i+1,j),prop_arrow{:}...
        ...,'FaceAlpha',0.4,'EdgeAlpha',0.4);
        );
end
plot([0 1 1 0 0]*Lx+[-1 1 1 -1 -1]*Bx,[0 0 1 1 0]*Ly+[-1 -1 1 1 -1 ]*By,'k');
hold off;
drawnow;
axis off;
xlim([0 1]*Lx+[-1 1]*(Bx+0.1));
ylim([0 1]*Ly+[-1 1]*(By+0.1));
saveas(gcf,'PositionsVelocitiesLJ','fig');
saveas(gcf,'PositionsVelocitiesLJ','epsc');

%return

%% Total Energy

bx1 = 80;
bx2 = 20;
by1 = 80;
by2 = 20;

xwi = 400;
ywi = 300;

Xpix = bx1+xwi+bx2;
Ypix = by1+ywi+by2;
figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix + [0 by1 0 ywi]/Ypix);
hold on;
plot(t_01,dE_01,'Linewidth',1,'color',[0 0 0]+0.5);
plot(t_001,dE_001,'Linewidth',1,'color',[0 0 0]);
plot(t_01([1 end]),[0 0],'Linewidth',0.5,'color',[0 0 0]);
% text(10,-2.1,'Total Energy $E_{\rm tot}(t)-E_{\rm tot}(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
ylabel('$E(t)-E_{0}$ ($\epsilon$)',options_label{:});
xlabel('$\Delta r$ ($\sigma$)',options_label{:});
ylim([-1 1]*2.5);
xlim(t_01([1 end]));

legend('$\Delta t = 0.01 t_0$','$\Delta t = 0.001 t_0$',...
    'Interpreter','Latex','Fontsize',14,'Orientation','horizontal','Location','North');
legend('boxoff');

saveas(gcf,'TotalEnergy','fig');
saveas(gcf,'TotalEnergy','epsc');



%% Kinetic Energy

bx1 = 80;
bx2 = 20;
by1 = 80;
by2 = 20;

xwi = 400;
ywi = 300;

Xpix = bx1+xwi+bx2;
Ypix = by1+ywi+by2;
figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix + [0 by1 0 ywi]/Ypix);
hold on;
plot(t_01,dK_01,'Linewidth',1,'color',[0 0 0]+0.5);
plot(t_001,dK_001,'Linewidth',1,'color',[0 0 0]);
plot(t_01([1 end]),[0 0],'Linewidth',0.5,'color',[0 0 0]);
% text(10,-21,'Kinetic Energy $K(t)-K(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
ylabel('$K(t)-K_{0}$ ($\epsilon$)',options_label{:});
xlabel('$\Delta r$ ($\sigma$)',options_label{:});
ylim([-1 1]*25);
xlim(t_01([1 end]));

legend('$\Delta t = 0.01 t_0$','$\Delta t = 0.001 t_0$',...
    'Interpreter','Latex','Fontsize',14,'Orientation','horizontal','Location','North');
legend('boxoff');

saveas(gcf,'KineticEnergy','fig');
saveas(gcf,'KineticEnergy','epsc');



%% Potential Energy

bx1 = 80;
bx2 = 20;
by1 = 80;
by2 = 20;

xwi = 400;
ywi = 300;

Xpix = bx1+xwi+bx2;
Ypix = by1+ywi+by2;
figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix + [0 by1 0 ywi]/Ypix);
hold on;
plot(t_01,dU_01,'Linewidth',1,'color',[0 0 0]+0.5);
plot(t_001,dU_001,'Linewidth',1,'color',[0 0 0]);
plot(t_01([1 end]),[0 0],'Linewidth',0.5,'color',[0 0 0]);
% text(10,-2.1,'Potential Energy $U_{\rm tot}(t)-U_{\rm tot}(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
ylabel('$U(t)-U_{0}$ ($\epsilon$)',options_label{:});
xlabel('$\Delta r$ ($\sigma$)',options_label{:});
ylim([-1 1]*25);
xlim(t_01([1 end]));

legend('$\Delta t = 0.01 t_0$','$\Delta t = 0.001 t_0$',...
    'Interpreter','Latex','Fontsize',14,'Orientation','horizontal','Location','North');
legend('boxoff');

saveas(gcf,'PotentialEnergy','fig');
saveas(gcf,'PotentialEnergy','epsc');



%% Temperature 
bx1 = 80;
bx2 = 20;
by1 = 80;
by2 = 20;

xwi = 400;
ywi = 300;

Xpix = bx1+xwi+bx2;
Ypix = by1+ywi+by2;
figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix + [0 by1 0 ywi]/Ypix);
hold on;
plot(t_01,dT_01,'Linewidth',1,'color',[0 0 0]+0.5);
plot(t_001,dT_001,'Linewidth',1,'color',[0 0 0]);
plot(t_01([1 end]),[0 0],'Linewidth',0.5,'color',[0 0 0]);
% text(10,-2.1,'Temperature $T(t)-T(0)$','Interpreter','Latex',...
%     'Fontsize',16,'Horizontalalignment','center','verticalalignment','middle');
hold off;
box on;
ylabel('$T(t)-T_{0}$ ($\epsilon/k_{\rm B}$)',options_label{:});
xlabel('$\Delta r$ ($\sigma$)',options_label{:});
xlabel('$t$ ($t_0$)',options_label{:});
ylim([-1 1]*2.5);
xlim(t_01([1 end]));
%text(3.3,4,'Lennard-Jones',options_text_sm{:},options_align_rb{:});
legend('$\Delta t = 0.01 t_0$','$\Delta t = 0.001 t_0$',...
    'Interpreter','Latex','Fontsize',14,'Orientation','horizontal','Location','North');
legend('boxoff');

saveas(gcf,'Temperature','fig');
saveas(gcf,'Temperature','epsc');





