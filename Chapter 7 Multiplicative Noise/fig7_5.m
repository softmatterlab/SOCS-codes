clear all; close all; clc;

figure_pos = [0 0 1000 670];

axes_pos = [[90 420 240 240]; 
            [410 420 240 240];
            [750 420 240 240]
            [90 80 240 240]; 
            [410 80 240 240];
            [750 80 240 240]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


load('data_Fig5_constant.mat','drift_av','drift_si','diff_av','diff_si','spurious_av',...
    'ref_drift','ref_diff','ref_spurious','xbins_spurious','xbins');
load(['init_traj_simu_constant' '.mat'],...
    'L','s1','s2','dt','Nbins','num_traj','Niter','alpha');

axes(a(1));
plot(xbins,drift_av,'.','color',c(1,:),'MarkerSize',12);
plot(xbins,ref_drift,'k');
xlim([-1 1]*L/2.01);
ylim([-1 1]*0.1);
labels('$x$','$c(x)$')

axes(a(2));
plot(xbins,diff_av,'.','color',c(1,:),'MarkerSize',12);
plot(xbins,ref_diff,'k');
ylim([0 2]);
xlim([-1 1]*L/2.01);
labels('$x$','$D(x)$')

axes(a(3));
plot(xbins_spurious,spurious_av,'.','color',c(1,:),'MarkerSize',12);
plot(xbins_spurious,ref_spurious,'k');
xlim([-1 1]*L/2.01);
ylim([-1 1]*0.1);
labels('$x$','$c_{\rm spurious}(x)$')

load('data_Fig5_gradient.mat','drift_av','drift_si','diff_av','diff_si','spurious_av',...
    'ref_drift','ref_diff','ref_spurious','xbins_spurious','xbins');
load(['init_traj_simu_gradient' '.mat'],...
    'L','s1','s2','dt','Nbins','num_traj','Niter','alpha');


axes(a(4));
plot(xbins,drift_av,'.','color',c(4,:),'MarkerSize',12);
plot(xbins,ref_drift,'k');
xlim([-1 1]*L/2.01);
ylim([-1 1]*0.1);
labels('$x$','$c(x)$')

axes(a(5));
plot(xbins,diff_av,'.','color',c(4,:),'MarkerSize',12);
plot(xbins,ref_diff,'k');
ylim([0 2]);
xlim([-1 1]*L/2.01);
labels('$x$','$D(x)$')


axes(a(6));
plot(xbins_spurious,spurious_av,'.','color',c(4,:),'MarkerSize',12);
plot(xbins_spurious,ref_spurious,'k');
xlim([-1 1]*L/2.01);
ylim([-1 1]*0.1);
labels('$x$','$c_{\rm spurious}(x)$')

