clear all; close all; clc; 

figure_pos = [0 0 1000 300];

axes_pos = [[5 80 205 205]; 
            [220 80 205 205];
            [505 80 205 205];
            [790 80 205 205]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end
Npart = 100;
eta100 = 40;
Rf=20;
Aref = pi*Rf^2;

d_list = [0 2];

load(['datafile_9.mat'],'x1','y1','d_list','closed_poly1',...
    'Lx','Ly','cf','psi','t','Npart');


cololines = cc(1,:)+(1-cc(1,:))*0.7;
colodots = cc(1,:);

colo{1} = [0    0.5647    0.7020];
colo{3} = [0.2039    0.7059         0];
colo{2} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];


for i=1:2
    axes(a(i));
    for j=1:Npart
        plot(closed_poly1{i,j}.x,closed_poly1{i,j}.y,'color',cololines);
    end
    plot(x1{i},y1{i},'.','color',colodots,'Markersize',10);
    plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
    xlim(1.0*[-1 1]*Lx/2);
    ylim(1.0*[-1 1]*Ly/2);
    axis off;
end

axes(a(3));
for i=1:2   
    plot(t{i}-1,psi{i}(t{i}),'color',colo{i},'linewidth',2);
end
xlim(t{1}([1 end])-1);
ylim([0 1.1]);
labels('$t$','$\psi$');
set(gca,'xtick',0:3000:9000)

axes(a(4));
for i=1:2   
    plot(t{i}-1,cf{i}(t{i}),'color',colo{i},'linewidth',2);
end
xlim(t{i}([1 end])-1);
ylim([0 1.1]);
set(gca,'xtick',0:3000:9000)
labels('$t$','$c$');
