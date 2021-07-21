clear all; close all; clc; 
figure_pos = [0 0 1000 360];

axes_pos = [[20 10 300 300]; 
    [340 10 300 300]
    [660 10 300 300]];

[h,a] = initfig(figure_pos,axes_pos);
axes(a(1));
h = imread('fig7a.png');
image(h(1:end,1:end,:));
title('$D_{\rm R} = 1$','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')

axes(a(2));
h = imread('fig7b.png');
image(fliplr(h(1:end,1:end,:)));
title('$D_{\rm R} = 0.2$','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')

axes(a(3));
h = imread('fig7c.png');
image(flipud(h(1:end,1:end,:)));
title('$D_{\rm R} = 0$','Fontsize',20,'Interpreter','latex')
axis('equal');
axis('off')