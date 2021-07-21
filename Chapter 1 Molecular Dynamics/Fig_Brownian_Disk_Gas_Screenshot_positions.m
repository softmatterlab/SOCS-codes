% figures for the Brownian Disk
clear all;
close all;
clc

dirout = ['.' filesep 'BrDi_2' filesep ];
fileprefix = 'BrownianDisk_2';

load([dirout 'init_' fileprefix '.mat']);

irepeti = 20; % repetition number
irepeti = 40; % repetition number
irepeti = 60; % repetition number
irepeti = 80; % repetition number
if irepeti > Nrepeti
    irepeti = Nrepeti;
end
i = 800; % iteration inside repetition
if i > Niter
    i = Niter;
end

ptraj = min([i, 900]);
traj_interval = i+1+(-ptraj:0);


xwi = 400;
ywi = 400;
bx1 = 10;
bx2 = 10;
by1 = 10;
by2 = 10;

Xpix = bx1 + xwi + bx2;
Ypix = by1 + ywi + by2;

thetaang = (0:1:360)*pi/180;

prop_arrow = {'StemWidth',2*[0.0250],'HeadWidth',2*[0.1000],'HeadLength',2*[0.1500],'HeadNode',2*[0.1000]};
mfg = 0.02;
mfd = 0.1;
mfr = 0.5;

load([dirout 'simulation_ ' fileprefix '_big_' num2str(irepeti) '.mat'],...
    'xb','yb','vbx','vby','Fbx','Fby',...
    'x','y','vx','vy','Fx','Fy','U');


fhte = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
set(gca,'Xtick',[],'Ytick',[]);
hold on;
%plot(x(i+1,:),y(i+1,:),'.k');
% plot trajectory gas particles
for j=1:Npart
    plot(x(traj_interval,j),y(traj_interval,j),'k','Linewidth',0.5);
end
% plot gas particles
fill(xb(i+1)+R*cos(thetaang),yb(i+1)+R*sin(thetaang),'g','EdgeColor','k');
for j=1:Npart
    fill(x(i+1,j)+mfr*rs*cos(thetaang),y(i+1,j)+mfr*rs*sin(thetaang),'r','EdgeColor','k');
end
% plot trajectory big disk
plot(xb(traj_interval),yb(traj_interval),'r','Linewidth',1.5);
% plot velocity of disk
arroww2d(xb(i+1),yb(i+1),...
    xb(i+1)+mfd*vbx(i+1),yb(i+1)+mfd*vby(i+1),prop_arrow{:}...
    ...,'FaceAlpha',0.4,'EdgeAlpha',0.4);
    );

% plot velocities of gas particles
% arrows
for j=1:Npart
    arroww2d(x(i+1,j),y(i+1,j),...
        x(i+1,j)+mfg*vx(i+1,j),y(i+1,j)+mfg*vy(i+1,j),prop_arrow{:},...
        'color',[0 0 0]+0.4...
        ...,'FaceAlpha',0.4,'EdgeAlpha',0.4);
        );
end


plot([0 1 1 0 0]*Lx,[0 0 1 1 0]*Ly,'k');
hold off;
box on;
axis off;
xlim([0 Lx]+[-1 1]*Bx);
ylim([0 Ly]+[-1 1]*By);
drawnow;
saveas(gcf,['Brownian_Disk' num2str(irepeti)],'fig');
saveas(gcf,['Brownian_Disk' num2str(irepeti)],'epsc');

% read previous trajectory for disk

load([dirout 'full_traj_disk.mat'],'XX','YY');
iglobal = Niter*(irepeti-1)+i+1;

% % % % % Nrepet_ini = 1;
% % % % % Nrepet_fin = irepeti-1;
% % % % % %Nrepet_fin = 20;
% % % % % 
% % % % % XX = [];
% % % % % YY = [];
% % % % % 
% % % % % for j = Nrepet_ini:Nrepet_fin
% % % % %     load([dirout 'simulation_ ' fileprefix '_big_' num2str(j) '.mat'],...
% % % % %         'xb','yb');
% % % % %     
% % % % %     XX=[XX; xb(1:end-1)];
% % % % %     YY=[YY; yb(1:end-1)];
% % % % % end
% % % % % j = irepeti;
% % % % % load([dirout 'simulation_ ' fileprefix '_big_' num2str(j) '.mat'],...
% % % % %     'xb','yb');
% % % % % 
% % % % % XX=[XX; xb(1:i+1)];
% % % % % YY=[YY; yb(1:i+1)];

hold on;
% plot FULL trajectory big disk
plot(XX(1:iglobal),YY(1:iglobal),'b','Linewidth',2.5);
hold off;
saveas(gcf,['Brownian_Disk_FULL_traj_' num2str(irepeti)],'fig');
saveas(gcf,['Brownian_Disk_FULL_traj_' num2str(irepeti)],'epsc');



return

%%
Nrepet_ini = 1;
Nrepet_fin = Nrepeti;
%Nrepet_fin = 20;

XX = [];
YY = [];

for j = Nrepet_ini:Nrepet_fin
    load([dirout 'simulation_ ' fileprefix '_big_' num2str(j) '.mat'],...
        'xb','yb');
    
    XX=[XX; xb(1:end-1)];
    YY=[YY; yb(1:end-1)];
end


save([dirout 'full_traj_disk.mat'],'XX','YY');


