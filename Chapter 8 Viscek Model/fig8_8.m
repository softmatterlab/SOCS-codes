clear all; close all; clc; 

figure_pos = [0 0 850 460];

axes_pos = [[80 80 335 335]; 
            [510 80 335 335]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

fig_str = '_7_8';

Npart = 100;
eta = 40;
Rf=20;
Aref = pi*Rf^2;

load(['datafile_' fig_str '.mat'],'x0','y0','x1','y1','d_list','closed_poly0','closed_poly1',...
    'Lx','Ly','c','phi','t','Npart',...
    'h','phi_dep','dphi_dep','c_dep','dc_dep');


axes(a(1));
errorbar(h,phi_dep,dphi_dep,'.k','Markersize',24,'Linewidth',2);
labels('$h$ ','$\psi$ ')
xlim(h([1 end]));
ylim([0 1.1]);

axes(a(2));
errorbar(h,c_dep,dc_dep,'.k','Markersize',24,'Linewidth',2);
labels('$h$ ','c ')
xlim(h([1 end]));
set(gca,'xtick',0:5:20);
ylim([0 1.1]);