% figures for the Brownian Disk
clear all;
close all;
clc

dirout = ['.' filesep 'BrDi_2_comp' filesep ];
fileprefix = 'BrownianDisk_2';
%dirout = ['.' filesep 'BrDi_3_comp' filesep ];
%fileprefix = 'BrownianDisk_3';



xwi = 400;
ywi = 400;
bx1 = 10;
bx2 = 10;
by1 = 10;
by2 = 10;

Xpix = bx1 + xwi + bx2;
Ypix = by1 + ywi + by2;

thetaang = (0:1:360)*pi/180;

% % t0 = 1;
% % epsilon = 1;
% % sigma = 1;

load([dirout 'init_' fileprefix '.mat']);

load([dirout 'simulation_ ' fileprefix '_global' '.mat'],...
    'XX','YY','VXX','VYY','UP','KP','EP',...
    'Kgas','VAX','VAY','Tgas','ET','t_list');


figure;
plot(t_list/t0,ET/epsilon,'k');
ylabel('E_{tot}/\epsilon (gas + Brownian Disk)');
xlabel('t/t_0 ');
saveas(gcf,[dirout 'f_ET_' fileprefix ],'fig');
saveas(gcf,[dirout 'f_ET_' fileprefix ],'epsc');

figure;
hold on;
plot(t_list/t0,ET/epsilon,'k');
plot(t_list/t0,Kgas/epsilon,'r');
plot(t_list/t0,EP/epsilon,'g');
hold off;
legend('total energy (gas+disk)','kinetic energy gas','total energy disk');
ylim([0 1]*max(ET)*1.1);
ylabel('E_{tot}/\epsilon (gas + Brownian Disk)');
xlabel('t/t_0 ');
saveas(gcf,[dirout 'f_ET_Kgas_EP_' fileprefix ],'fig');
saveas(gcf,[dirout 'f_ET_Kgas_EP_' fileprefix ],'epsc');


figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
hold on;
plot(XX,YY,'b','LineWidth',1.5);
hold off;
axis equal on;
legend('trajectory disk center');
box on;
xlim([0 Lx]+[-1 1]*Bx);
ylim([0 Ly]+[-1 1]*By);
set(gca,'Xtick',[],'Ytick',[]);
saveas(gcf,[dirout 'f_traj_disk_' fileprefix ],'fig');
saveas(gcf,[dirout 'f_traj_disk_' fileprefix ],'epsc');

%% MSD
% 
% close all;
% 
% optionslabel = {'Interpreter','Latex','Fontsize',30};
% 
% [ MSD_dep, time_dep ] = MSDf( [XX, YY], Niter*dt );
% save([dirout 'data_disk_MSD.mat'],'XX','YY','MSD_dep','time_dep');
% 
% 
% log_MSD_dep = log(MSD_dep);
% log_time_dep = log(time_dep);
% slope_log = (log_MSD_dep(3:end)-log_MSD_dep(2:end-1))./(log_time_dep(3:end)-log_time_dep(2:end-1));
% slope_log = [NaN slope_log];
% 
% j0 = find(slope_log>1,1,'last');
% int_linear = max([j0-15,2]):min([j0+10,numel(time_dep)]);
% 
% figure('Position',[50 50 Xpix+9*bx1 Ypix+9*by1]);
% axes('Position',[bx1+8*bx1 0 xwi 0]/(Xpix+9*bx1)+[0 by1+8*by1 0 ywi]/(Ypix+9*by1));
% hold on;
% l = 1:21;
% ind = round(1.199.^l);
% plot(time_dep(ind),MSD_dep(ind),'b.','MarkerSize',30);
% plot(time_dep(int_linear),(MSD_dep(j0))*time_dep(int_linear)/time_dep(j0),'r','LineWidth',1.5);
% hold off;
% set(gca,'Xscale','log','Yscale','log');
% set(gca,'Xtick',[1e-6, 1e-4, 1e-2, 1e-0, 1e+2]);
% set(gca,'Ytick',[1e-8, 1e-6, 1e-4, 1e-2, 1e-0, 1e+2]);
% set(gca,'fontsize',15)
% xlim([1e-2 1e+2]);
% ylim([1e-2 1e+2]);
% xlabel(['$\tau$ ($t_0$)'],optionslabel{:});
% ylabel(['MSD ($\sigma_0^2$)'],optionslabel{:});
% box on;
% saveas(gcf,[dirout 'log_MSD' ],'fig');
% saveas(gcf,[dirout 'log_MSD' ],'epsc');

% figure('Position',[50 50 Xpix+9*bx1 Ypix+9*by1]);
% axes('Position',[bx1+8*bx1 0 xwi 0]/(Xpix+9*bx1)+[0 by1+8*by1 0 ywi]/(Ypix+9*by1));
% hold on;
% plot(time_dep,MSD_dep,'b','LineWidth',1.5);
% hold off;
% xlabel(['$\tau$ ($t_0$)'],optionslabel{:});
% ylabel(['MSD ($\sigma_0^2$)'],optionslabel{:});
% box on;
% set(gca,'fontsize',15)
% saveas(gcf,[dirout 'lin_MSD' ],'fig');
% saveas(gcf,[dirout 'lin_MSD' ],'epsc');
% 
% int_nz = 2:(numel(time_dep));
% 
% figure('Position',[50 50 Xpix+9*bx1 Ypix+9*by1]);
% axes('Position',[bx1+8*bx1 0 xwi 0]/(Xpix+9*bx1)+[0 by1+8*by1 0 ywi]/(Ypix+9*by1));
% hold on;
% plot(time_dep(int_nz),slope_log,'b','LineWidth',1.5);
% plot(time_dep(int_nz),1+0*time_dep(int_nz),'k');
% hold off;
% xlabel(['$\tau$ ($t_0$)'],optionslabel{:});
% ylabel(['$\alpha$'],optionslabel{:});
% box on;
% set(gca,'fontsize',15)
% saveas(gcf,[dirout 'exp_MSD' ],'fig');
% saveas(gcf,[dirout 'exp_MSD' ],'epsc');





return

