clear all; close all; clc; 

figure_pos = [0 0 800 410];

axes_pos = [[75 80 320 320]; 
            [475 80 320 320]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

x0 = 10;
y0 = 10;
alpha = 1.1;
beta = 0.4;
gamma = 1.1;
delta = 0.4;
dt=1; Niter = 3;
dx_list = -3:0.01:3;
dy_list = -3:0.01:3;
[xs,ys,vx,vy,xeq,yeq,dr,x_list,y_list] = LV_vector_field(alpha,beta,gamma,delta);

axes(a(1));

quiver(xs,ys,vx,vy,'Linewidth',2,'color',cc(1,:));
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
plot(xeq,yeq,'.k','Markersize',10);
fill([0 1 1 0 0]*0.5 + 0.2, 5.3+[0 0 1 1 0]*0.7,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
xlim(x_list([1 end])+0.5*dr*[-1 1]);
ylim(y_list([1 end])+0.5*dr*[-1 1]);
labels('$x$','$y$')


[Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant(alpha,beta,gamma,delta);
axes(a(2));
[Mn,cn] = contourf(xs,ys,Invariant,Id_levels,'color',cc(1,:));
plot(x_list([1 end])+dr*[-1 1],yeq+[0 0],'k--','Linewidth',1);
plot(xeq+[0 0],y_list([1 end])+dr*[-1 1],'k--','Linewidth',1);
fill([0 1 1 0 0]*0.5 + 0.2, 5.3+[0 0 1 1 0]*0.7,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
plot(xeq,yeq,'.k','Markersize',10);
labels('$x$','$y$')
colormap(white);