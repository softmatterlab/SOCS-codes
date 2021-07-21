clear all; close all; clc; 

figure_pos = [0 0 1000 410];

axes_pos = [[5 80 300 300]; 
            [315 80 300 300];
            [695 80 300 300]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


Npart = 100;
eta100 = 4;
Rf=1;
file_str = ['N' num2str(Npart) '_eta' num2str(eta100) '_flockR' num2str(Rf)];

load(['datafile_' file_str '.mat'],'x0','y0','x1','y1','closed_poly0','closed_poly1','Lx','Ly','c','phi','t','Npart');

cololines = cc(1,:)+(1-cc(1,:))*0.7;
colodots = cc(1,:);

axes(a(1));

for j=1:Npart
    plot(closed_poly0{j}.x,closed_poly0{j}.y,'color',cololines);
end
plot(x0,y0,'.','color',colodots,'Markersize',10);
plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
xlim(1.0*[-1 1]*Lx/2);
ylim(1.0*[-1 1]*Ly/2);
axis('off');


axes(a(2));
for j=1:Npart
    plot(closed_poly1{j}.x,closed_poly1{j}.y,'color',cololines);
end
plot(x1,y1,'.','color',colodots,'Markersize',10);
plot([-1 1 1 -1 -1]*Lx/2,[-1 -1 1 1 -1]*Lx/2,'k','Linewidth',2);
hold off;
xlim(1.0*[-1 1]*Lx/2);
ylim(1.0*[-1 1]*Ly/2);
axis('off')

axes(a(3));
plot(t-1,phi(t),'color',cc(1,:),'linewidth',2);
plot(t-1,c(t),'color',cc(2,:),'linewidth',2);
xlim(t([1 end])-2);
ylim([0 1.19]);
labels('$t$','$\psi,\ c$')
legend('$\psi$','$c$','fontsize',18,'Interpreter','latex','box','off','location','southeast');