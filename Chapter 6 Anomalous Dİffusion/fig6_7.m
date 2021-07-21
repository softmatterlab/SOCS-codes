clear all; close all; clc; 

figure_pos = [0 0 1000 340];

axes_pos = [[10 10 320 320]; 
            [340 10 320 320]
            [670 10 320 320]];


[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



axes(a(1));
load('fig_AD_speckle_a.mat');
I(I>0) = 0;
I(200,200) = 15;
imagesc(I);
plot(x-10,y-10,'k');
xlim([0.5 199.5]);
ylim([0.5 199.5]);
set(gca,'xTick',[],'yTick',[])
title('P = 0');
% labels('$x$','$y$',20)
title('$P = 0$','FontSize',22,'Interpreter','Latex');
axis('off');


axes(a(2));
load('fig_AD_speckle_b.mat');
I = I/5;
I(I>3) = 3;
I(200,200) = 15;
imagesc(I);
plot(x-10,y-10,'k');
xlim([0.5 199.5]);
ylim([0.5 199.5]);
set(gca,'xTick',[],'yTick',[])
title('$P = 1$','FontSize',22,'Interpreter','Latex');
% labels('$x$','$y$',20)
axis('off');

axes(a(3));
load('fig_AD_speckle_c.mat');
% I(I>15) = 45;
% I(1,1) = 15;
imagesc(I);
plot(x-10,y-10,'k');
xlim([0.5 199.5]);
ylim([0.5 199.5]);
set(gca,'xTick',[],'yTick',[])
title('$P = 5$','FontSize',22,'Interpreter','Latex');
% labels('$x$','$y$',20)
axis('off');

n = 100;
gamma = 50;
for i=1:(n+gamma)
    C(i,:)=[0.95 0.95 0.95]*(1-(i-1)/n)+[1 0.2 0.2]*(i-1)/n;
    if i>n
        C(i,:) = [1 0.2 0.2];
    end 
end

colormap(C)