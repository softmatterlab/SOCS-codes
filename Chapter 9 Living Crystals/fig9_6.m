clear all; close all; clc; 
figure_pos = [0 0 1000 360];

axes_pos = [[20 10 300 300]; 
    [340 10 300 300]
    [660 10 300 300]];

[h,a] = initfig(figure_pos,axes_pos);
axes(a(1));
h = imread('fig5a.png');
image(fliplr(h(3:end-3,2:end-1,:)));
title('$v_{0} = 0$','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')

axes(a(2));
h = imread('fig5b.png');
image(h(1:end-5,3:end-3,:));
title('$v_{0} = 20 \ \mu$m/s','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')

axes(a(3));
h = imread('fig5c.png');
image(h(5:end,1:end,:));
title('$v_{0} = 50 \ \mu$m/s','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')