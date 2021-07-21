% plot drift diffusion
clear all;
close all;
clc;

colo{1} = [0    0.5647    0.7020];
colo{2} = [0.2039    0.7059         0];
colo{3} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];

outdir = ['.' filesep];

load('data_Fig5_gradient.mat','drift_av','drift_si','diff_av','diff_si','spurious_av',...
    'ref_drift','ref_diff','ref_spurious','xbins_spurious','xbins');
load(['init_traj_simu_gradient' '.mat'],...
    'L','s1','s2','dt','Nbins','num_traj','Niter','alpha');

% load('data_Fig5_constant.mat','drift_av','drift_si','diff_av','diff_si','spurious_av',...
%     'ref_drift','ref_diff','ref_spurious','xbins_spurious','xbins');
% load(['init_traj_constant' '.mat'],...
%     'L','s1','s2','dt','Nbins','num_traj','Niter','alpha');



options_label = {'Interpreter','Latex','fontsize',20};
options_title = {'Interpreter','Latex','fontsize',20};


% figure 3 panels
bx1 = 60;
bx2 = 20;
bx3 = 10;
by1 = 40;
by2 = 20;
xwi = 300;
ywi = 300;
Xpix = bx1+xwi+bx3+bx1+xwi+bx3+bx1+xwi+bx2;
Ypix = by1+ywi+by2;

fh = figure('Position',[50 50 Xpix Ypix]);
% drift
ah(1) = axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
% diffusion
ah(2) = axes('Position',[bx1+xwi+bx3+bx1, 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);
% noise induced drift
ah(3) = axes('Position',[bx1+xwi+bx3+bx1+xwi+bx3+bx1, 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);


% drift
figure(fh);
set(gcf,'CurrentAxes',ah(1));
hold on;
plot(xbins,drift_av,'.','color',colo{3});
plot(xbins,ref_drift,'k');
hold off;
box on;
xlim([-1 1]*L/2);
ylim([-1 1]*0.1);
xlabel('$x$',options_label{:});
ylabel('$c(x)$',options_label{:});



% diffusion
figure(fh);
set(gcf,'CurrentAxes',ah(2));
hold on;
plot(xbins,ref_diff,'k');
plot(xbins,diff_av,'.','color',colo{3});
hold off;
box on;
ylim([0 2]);
xlim([-1 1]*L/2);
xlabel('$x$',options_label{:});
ylabel('$D(x)$',options_label{:});
    
    
% spurious drift  
figure(fh);
set(gcf,'CurrentAxes',ah(3));
hold on;
plot(xbins_spurious,spurious_av,'.','color',colo{3});
plot(xbins_spurious,ref_spurious,'k');
hold off;
box on;
xlim([-1 1]*L/2);
ylim([-1 1]*0.1);
xlabel('$x$',options_label{:});
ylabel('$c_{\rm spurious}(x)$',options_label{:});
    

saveas(gcf,'gradient','fig');
saveas(gcf,'gradient','epsc');
    



