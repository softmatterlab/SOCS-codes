clear all; close all; clc; 
figure_pos = [0 0 1000 360];

axes_pos = [[20 10 300 300]; 
    [340 10 300 300]
    [660 10 300 300]];

[hh,a] = initfig(figure_pos,axes_pos);
axes(a(1));
h = imread('fig9a.png');
x = 173; y=152;
image(h(x:x+695,y:y+695,:)); 
% title('$D_R = 1$','Fontsize',20,'Interpreter','latex')
axis('equal');
title('$t=0$','Fontsize',20,'Interpreter','latex')
fill([0 1 1 0 0]*60+25,605+[0 0 1 1 0]*80,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis('off')

axes(a(2));
h = imread('fig9b.png');
x = 173; y=152;
image(h(x:x+695,y:y+695,:)); 
% title('$D_R = 0.2$','Fontsize',20,'Interpreter','latex')
title('$t=10$ s','Fontsize',20,'Interpreter','latex')
fill([0 1 1 0 0]*60+25,605+[0 0 1 1 0]*80,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis('equal');
axis('off')

axes(a(3));
h = imread('fig9c.png');
x = 173; y=152;
image(h(x:x+695,y:y+695,:)); 
% title('$D_R = 0$','Fontsize',20,'Interpreter','latex')
axis('equal');
title('$t=50$ s','Fontsize',20,'Interpreter','latex')
fill([0 1 1 0 0]*60+25,605+[0 0 1 1 0]*80,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis('off')