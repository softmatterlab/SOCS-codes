% simulation of LJ gas
%

clear all;
close all;
clc;


sigma = 1;
epsilon = 1;
m = 1;
kB = 1.38e-23;
t0 = sigma*sqrt(m/epsilon);
v0 = sqrt(epsilon/m);
F0 = epsilon/sigma;
T0 = epsilon/kB;

% 
rootN = 6;
rootN = 6;
Npart = rootN*rootN;

part_density = 0.1;
area_per_particle = (pi*sigma^2)/part_density;
unit_side = sqrt(pi/part_density)*sigma;

gridX0 = rootN/2 + (-(rootN-1):2:(rootN-1))/2;
gridY0 = gridX0;

gridX0 = gridX0*unit_side;
gridY0 = gridY0*unit_side;

Lx = rootN*unit_side;
Ly = rootN*unit_side;
Bx = sigma/2; %2*sigma;
By = sigma/2; %2*sigma;





vs = 2*v0;
dt = 0.001*t0;
% Niter = 3e+2;
Niter = 3e+3;
% Niter = 3e+5;

K_pair=m*vs^2;
% V(rmin) = K_pair
% R = (r/sigma)^6
% z = 1/R;
% z = 0.5*(1+sqrt(1+K_pair/epsilon));
% (r_min/sigma)^6 = 2/(1+sqrt(1+K_pair/epsilon));
% (r_min/sigma) = (2/(1+sqrt(1+K_pair/epsilon)))^(1/6);
%
rmin = sigma*(2/(1+sqrt(1+K_pair/epsilon)))^(1/6);

% rmin
% pause

rmax = 5*sigma;

r_Vmin = 2^(1/6)*sigma;
vs*dt/((r_Vmin-sigma)/sigma)


% variables
x = zeros(Niter+1,Npart);
xh = zeros(Niter+1,Npart);
y = zeros(Niter+1,Npart);
yh = zeros(Niter+1,Npart);
vx = zeros(Niter+1,Npart);
vy = zeros(Niter+1,Npart);
v = zeros(Niter+1,Npart);
Fx = zeros(Niter+1,Npart);
Fy = zeros(Niter+1,Npart);


hit_x1 = zeros(Niter+1,Npart);
hit_x2 = zeros(Niter+1,Npart);
hit_y1 = zeros(Niter+1,Npart);
hit_y2 = zeros(Niter+1,Npart);
change_vy = zeros(Niter+1,Npart);
change_vx = zeros(Niter+1,Npart);


Pup = zeros(Niter+1,1);
Pdown = zeros(Niter+1,1);
Pleft = zeros(Niter+1,1);
Pright = zeros(Niter+1,1);
Pext = zeros(Niter+1,1);
Phor = zeros(Niter+1,1);
Pver = zeros(Niter+1,1);
T = zeros(Niter+1,1);
K = zeros(Niter+1,1);
U = zeros(Niter+1,1);
E = zeros(Niter+1,1);
v_av = zeros(Niter+1,2);
sp_av = zeros(Niter+1,1);
v_si = zeros(Niter+1,2);
sp_si = zeros(Niter+1,1);


[Xcoo, Ycoo] = meshgrid(gridX0,gridY0);



x(1,:) = Xcoo(:);
y(1,:) = Ycoo(:);
phi = (2*rand(1,Npart)-1)*pi;
vx(1,:) = vs*cos(phi);
vy(1,:) = vs*sin(phi);
v(1,:) = sqrt(vx(1,:).^2+vy(1,:).^2);
v_av(1) = mean(vx(1,:)); v_av(2) = mean(vy(1,:));
v_si(1) = std(vx(1,:));  v_si(2) = std(vy(1,:));
sp_av(1) = mean(v(1,:)); sp_si(1) = std(v(1,:));
K(1) = 1/2*m*sum(vx(1,:).^2+vy(1,:).^2);
T(1) = K(1)/Npart;
[Fx(1,:),Fy(1,:),U(1)] = LJ_force_potential_0(x(1,:),y(1,:),sigma,epsilon,rmin,rmax);
E(1) = K(1)+U(1);


xwi = 400;
ywi = 400;
bx1 = 10;
bx2 = 10;
by1 = 10;
by2 = 10;

Xpix = bx1 + xwi + bx2;
Ypix = by1 + ywi + by2;

thetaang = (0:1:360)*pi/180;


fhte = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
set(gca,'Xtick',[],'Ytick',[]);
hold on;
%plot(x(i+1,:),y(i+1,:),'.r','Markersize',10);
for j=1:Npart
    fill(x(1,j)+sigma*cos(thetaang),y(1,j)+sigma*sin(thetaang),'g','EdgeColor','k');
end
        plot([0 1 1 0 0]*Lx+[-1 1 1 -1 -1]*Bx,[0 0 1 1 0]*Ly+[-1 -1 1 1 -1 ]*By,'k');
hold off;
box on;
axis off;
xlim([0 Lx]+[-1 1]*Bx);
ylim([0 Ly]+[-1 1]*By);
drawnow;

pause

prop_arrow = {'StemWidth',0.05,'HeadWidth',0.2,'HeadLength',0.3,'HeadNode',0.2};


for i=1:Niter
    i
    
    xh(i,:) = x(i,:) + vx(i,:)*0.5*dt;
    yh(i,:) = y(i,:) + vy(i,:)*0.5*dt;
    
    % calculate the force
    [Fx1,Fy1,V1] = LJ_force_potential_0(xh(i,:),yh(i,:),sigma,epsilon,rmin,rmax);
    
    vx(i+1,:) = vx(i,:) + Fx1/m*dt;
    vy(i+1,:) = vy(i,:) + Fy1/m*dt;
    
    x(i+1,:) = xh(i,:) + vx(i+1,:)*0.5*dt;
    y(i+1,:) = yh(i,:) + vy(i+1,:)*0.5*dt;
    
    % reflect left
    ileft = find(x(i+1,:)<0);
    x(i+1,ileft) = -x(i+1,ileft);
    change_vx(i+1,ileft) = -2*vx(i+1,ileft);
    hit_x1(i+1,ileft) = 1;
    vx(i+1,ileft) = -vx(i+1,ileft);
    Pleft(i+1) = 2*m*sum(vx(i+1,ileft))/dt/Lx;
    
    % reflect right
    iright = find(x(i+1,:)>Lx);
    x(i+1,iright) = Lx-(x(i+1,iright)-Lx);
    change_vx(i+1,iright) = -2*vx(i+1,iright);
    hit_x2(i+1,iright) = 1;
    vx(i+1,iright) = -vx(i+1,iright);
    Pright(i+1) = 2*m*sum(vx(i+1,iright))/dt/Lx;
    
    Phor(i+1) = 0.5*(Pleft(i+1)-Pright(i+1));
    
    % reflect up
    iup = find(y(i+1,:)>Ly);
    y(i+1,iup) = Ly-(y(i+1,iup)-Ly);
    change_vy(i+1,iup) = -2*vy(i+1,iup);
    hit_y2(i+1,iup) = 1;
    vy(i+1,iup) = -vy(i+1,iup);
    Pup(i+1) = 2*m*sum(vy(i+1,iup))/dt/Ly;
    
    % reflect down
    idown = find(y(i+1,:)<0);
    y(i+1,idown) = -y(i+1,idown);
    change_vy(i+1,idown) = -2*vy(i+1,idown);
    hit_y1(i+1,idown) = 1;
    vy(i+1,idown) = -vy(i+1,idown);
    Pdown(i+1) = 2*m*sum(vy(i+1,idown))/dt/Ly;
    
    Pver(i+1) = 0.5*(Pdown(i+1)-Pup(i+1));
    
    % calculate the force
    [Fx2,Fy2,U(i+1)] = LJ_force_potential_0(x(i+1,:),y(i+1,:),sigma,epsilon,rmin,rmax);
    
    Fx(i+1,:) = Fx2;
    Fy(i+1,:) = Fy2;
    
    v2 = vx(i,:).^2+vy(i,:).^2;
    v(i,:) = sqrt(v2);
    K(i) = 1/2*m*sum(v2);
    T(i) = 1/2*m*mean(v2)/(1/2*kB)/2; % the last two is the dimension of the system
    E(i) = U(i)+sum(K(i));
    
    sp_av(i) = mean(v(i,:));
    sp_si(i) = std(v(i,:));
    
    if mod(i,100000) == 1
        figure(fhte);
        cla;
        hold on;
        lenplottraj = 400;
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
            fill(x(i+1,j)+0.5*sigma*cos(thetaang),y(i+1,j)+0.5*sigma*sin(thetaang),'r','EdgeColor','k');
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
        %saveas(gca,['perfGas' num2str(i+1)], 'fig');
    end
    
end

close all;

save('simulation_big_for_figure_smaller.mat');

%% 
clear all;
load('simulation_big_for_figure.mat','dt','x','y','vx','vy','Lx','Ly','Bx','By',...
    'Niter','sigma','m','epsilon','t0','v0','T0','K','E','U','T');

v2 = vx(Niter+1,:).^2+vy(Niter+1,:).^2;
K(Niter+1) = 1/2*m*sum(v2);
E(Niter+1) = U(Niter+1)+sum(K(Niter+1));
T(Niter+1) = 1/2*m*mean(v2)/(1/2*PhysConst.kB)/2; % the last two is the dimension of the system


t_int = ((1:Niter+1)-1)*dt;
figure;
hold on;
plot(t_int,K,'r');
plot(t_int,E,'g');
plot(t_int,U,'k');
hold off;
drawnow;

figure;
hold on;
plot(t_int,T/T0,'b');
hold off;
drawnow;


% case of Argon-liker particles

close all;

m_Ar = 6.63e-26; % kg
sigma_Ar = 3.410e-10; % m
epsilon_Ar = 1.67e-21; % J
t0_Ar = 2.14e-12; % s
v0_Ar = 159e-0; % m/s
T0_Ar = 121e-0; % K


t_int_Ar = t_int*t0_Ar;

T_Ar = T/T0*T0_Ar; % in Kelvin
T_in_Ar = T_Ar(1);
T_av_Ar = mean(T/T0*T0_Ar);
kBT = T_in_Ar*PhysConst.kB;

[p1,S1] = polyfit(t_int_Ar,T_Ar,1); 
[T_Ar_fit1,delta_T_Ar1] = polyval(p1,t_int_Ar,S1);

[p2,S2] = polyfit(t_int,T/T0,2); 
[T_fit2,delta_T2] = polyval(p2,t_int,S2);

T_Ar_fit2 = T_fit2*T0_Ar;
delta_T_Ar2 = delta_T2*T0_Ar;

K_Ar = K*epsilon_Ar;
E_Ar = E*epsilon_Ar;
U_Ar = U*epsilon_Ar;

% % save('simulation_3e5.mat','t_int','dt','x','y','vx','vy','Lx','Ly','Bx','By',...
% %     'Niter','sigma','m','epsilon','t0','v0','T0','K','E','U','T',...
% %     'sigma_Ar','m_Ar','epsilon_Ar','t0_Ar','v0_Ar','T0_Ar','T_Ar','K_Ar','E_Ar','U_Ar','t_int_Ar',...
% %     'T_in_Ar','T_av_Ar','kBT','T_Ar_fit1','delta_T_Ar1','T_Ar_fit2','delta_T_Ar2');

save('simulation_3e4.mat','t_int','dt','x','y','vx','vy','Lx','Ly','Bx','By',...
    'Niter','sigma','m','epsilon','t0','v0','T0','K','E','U','T',...
    'sigma_Ar','m_Ar','epsilon_Ar','t0_Ar','v0_Ar','T0_Ar','T_Ar','K_Ar','E_Ar','U_Ar','t_int_Ar',...
    'T_in_Ar','T_av_Ar','kBT','T_Ar_fit1','delta_T_Ar1','T_Ar_fit2','delta_T_Ar2');


figure;
hold on;
plot(t_int_Ar,K*epsilon_Ar/kBT,'r');
plot(t_int_Ar,E*epsilon_Ar/kBT,'g');
plot(t_int_Ar,U*epsilon_Ar/kBT,'k');
hold off;
drawnow;

figure;
hold on;
%plot(t_int,K*epsilon_Ar/kBT,'r');
plot(t_int_Ar,E*epsilon_Ar/kBT,'g');
%plot(t_int,U*epsilon_Ar/kBT,'k');
hold off;
ylim([-1 1]+round(mean(E*epsilon_Ar/kBT)));
drawnow;
box on;

figure;
hold on;
plot(t_int_Ar,T_in_Ar+0*t_int_Ar,'r');
plot(t_int_Ar,T_av_Ar+0*t_int_Ar,'r');
plot(t_int_Ar,T_Ar,'b');
plot(t_int_Ar,T_Ar_fit1,'k');
plot(t_int_Ar,T_Ar_fit1+2*delta_T_Ar1,'k--');
plot(t_int_Ar,T_Ar_fit1-2*delta_T_Ar1,'k--');
plot(t_int_Ar,T_Ar_fit2,'c');
plot(t_int_Ar,T_Ar_fit2+2*delta_T_Ar2,'c--');
plot(t_int_Ar,T_Ar_fit2-2*delta_T_Ar2,'c--');
hold off;
ylim([200 300]);
drawnow;


return

%% replay

for i=1:10:Niter
   
    figure(fhte);
    cla;
    hold on;
    %plot(x(i+1,:),y(i+1,:),'.r','Markersize',10);
    for j=1:Npart
        fill(x(i+1,j)+0.5*sigma*cos(thetaang),y(i+1,j)+0.5*sigma*sin(thetaang),'r','EdgeColor','k');
    end
    plot([0 1 1 0 0]*Lx,[0 0 1 1 0]*Ly,'k');
    hold off;
    
    
end

return



%% movie

Bx = sigma/2;
By = sigma/2;
rs = sigma/2;

% vidObj = VideoWriter('simulation_big_dt005_v2.avi');
% vidObj.FrameRate = 30;
% open(vidObj);

fhte = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
set(gca,'Xtick',[],'Ytick',[]);
hold on;
%plot(x(i+1,:),y(i+1,:),'.r','Markersize',10);
% for j=1:Npart
%     fill(x(1,j)+sigma*cos(thetaang),y(1,j)+sigma*sin(thetaang),'g','EdgeColor','k');
% end
plot([0 1 1 0 0]*Lx+[-1 1 1 -1 -1]*Bx,[0 0 1 1 0]*Ly+[-1 -1 1 1 -1 ]*By,'k');
hold off;
box on;
axis off;
xlim([0 Lx]+[-1 1]*Bx);
ylim([0 Ly]+[-1 1]*By);
drawnow;

for irepeti = 1

    load(['simulation_big_dt005_v2.mat'],...
        'x','y');


%     if irepeti >1
%         x(1,:) = x(end,:);
%         y(1,:) = y(end,:);
%         vx(1,:) = vx(end,:);
%         vy(1,:) = vy(end,:);
%         Fx(1,:) = Fx(end,:);
%         Fy(1,:) = Fy(end,:);
%         U(1) = U(end);
%     end
%     tic;
    
    
    for i=1:Niter
        
        figure(fhte);
        cla;
        hold on;
        for j=1:Npart
            fill(x(i+1,j)+rs*cos(thetaang),y(i+1,j)+rs*sin(thetaang),'g','EdgeColor','k');
        end
        plot([0 1 1 0 0]*Lx+[-1 1 1 -1 -1]*Bx,[0 0 1 1 0]*Ly+[-1 -1 1 1 -1 ]*By,'k');
        hold off;
        drawnow;
        pause
%         F = getframe(fhte);
%         writeVideo(vidObj,F);
    end
    
end

%close(vidObj);

return





%%

load('simulation.mat');

Lx = 20*sigma;
Ly = 20*sigma;
Bx = 0; %2*sigma;
By = 0; %2*sigma;


fhte = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
set(gca,'Xtick',[],'Ytick',[]);
box on;
axis off;
xlim([0 Lx]+[-1 1]*Bx);
ylim([0 Ly]+[-1 1]*By);



i0 = size(x,1)-1000;
i1 = i0+125;
%i1 = i0+250;
%i1 = i0+500;
%i1 = i0+1000;


figure(fhte);
cla;
hold on;
for j=1:Npart
    plot(x(i0:i1,j),y(i0:i1,j),'Color',[1 0.5 0.0]);
end
plot(x(i1,:),y(i1,:),'.r','Markersize',20);
plot([0 1 1 0 0]*Lx,[0 0 1 1 0]*Ly,'k','Linewidth',2);
hold off;




%%

load('simulation.mat');

figure;
hold on;
plot(E,'g');
plot(K,'r');
plot(U,'b');
hold off;


figure;
hold on;
plot(sp_av,'m');
plot(sp_av+sp_si,'y');
plot(sp_av-sp_si,'y');
hold off;


figure;
hold on;
plot(Phor,'c');
plot(Pver,'k');
hold off;

n_t = floor(10*t0/dt);
n_e = floor((Niter+1)/n_t);

p_hor_r = reshape(Phor(1:(n_t*n_e)),n_t,n_e);
p_ver_r = reshape(Pver(1:(n_t*n_e)),n_t,n_e);

p_hor_av = sum(p_hor_r,1);
p_ver_av = sum(p_ver_r,1);

figure;
hold on;
plot(p_hor_av/n_t,'c');
plot(p_ver_av/n_t,'k');
hold off;
ylim([0 max([p_hor_av(:)',p_ver_av(:)'])]/n_t);






