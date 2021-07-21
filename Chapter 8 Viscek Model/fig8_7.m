clear all; close all; clc; 

figure_pos = [0 0 1000 260];

axes_pos = [[5 10 240 240]; 
            [255 10 240 240];
            [505 10 240 240];
            [755 10 240 240]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end
cololines = cc(1,:)+(1-cc(1,:))*0.7;
colodots = cc(1,:);

Npart = 100;
eta = 40;
Rf=20;
Aref = pi*Rf^2;
fig_str = '_7_8';
load(['datafile_' fig_str '.mat'],'x0','y0','x1','y1','d_list','closed_poly0','closed_poly1',...
    'Lx','Ly','c','phi','t','Npart',...
    'h','phi_dep','dphi_dep','c_dep','dc_dep');


axes(a(1));
for j=1:Npart
     plot(closed_poly0{j}.x,closed_poly0{j}.y,'color',cololines);
end
plot(x0,y0,'.','color',colodots,'Markersize',10);
plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
xlim(1.0*[-1 1]*Lx/2);
ylim(1.0*[-1 1]*Ly/2);
axis off;


for i=1:3
    axes(a(i+1));
    for j=1:Npart
        plot(closed_poly1{i,j}.x,closed_poly1{i,j}.y,'color',cololines);
    end
    plot(x1{i},y1{i},'.','color',colodots,'Markersize',10);
    plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
    xlim(1.0*[-1 1]*Lx/2);
    ylim(1.0*[-1 1]*Ly/2);
    axis off;
end