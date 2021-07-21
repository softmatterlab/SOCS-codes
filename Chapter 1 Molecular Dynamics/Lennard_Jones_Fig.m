%
%

clear all;
close all;
clc;

sigma = 1;
epsilon = 0.2;
x = (0.8:0.01:3)*sigma;

V = 4*epsilon*((x/sigma).^(-12)-(x/sigma).^(-6));
F = 24*epsilon*(2*(x/sigma).^(-12)-(x/sigma).^(-6))./x;


bxl = 50;
bxr = 10;
bxm1 = 10;
xwi = 300;
ywi = 300;
byt = 20;
byb = 40;

Ypix = byb+ywi+byt;
Xpix = bxl+xwi+bxr;


fsl = 16;
options_label = {'Interpreter','Latex','fontsize',fsl};


figure('Position',[50 50 Xpix Ypix]);
axes('Position',[bxl 0 xwi 0]/Xpix+[0 byb 0 ywi]/Ypix);
hold on;
plot(x/sigma,V/epsilon,'-k');
%plot(x/sigma,F/epsilon,'-r');
plot([0 3],[0 0],':k');
hold off;
xlim([0 3]);
ylim([-3 5]);
% xlabel('$r$  ($\sigma$)',options_label{:});
% ylabel('$V(r)$  ($\epsilon$)',options_label{:});
xlabel('$r/\sigma$',options_label{:});
ylabel('$V(r)/\epsilon$',options_label{:});
box on;
drawnow;
% 
% 
% figure('Position',[50 50 Xpix Ypix]);
% axes('Position',[bxl 0 xwi 0]/Xpix+[0 byb 0 ywi]/Ypix);
% hold on;
% %plot(x/sigma,V/epsilon,'-k');
% plot(x/sigma,F/epsilon,'-r');
% plot([0 3],[0 0],':k');
% hold off;
% xlim([0 3]);
% ylim([-3 5]);
% % xlabel('$r$  ($\sigma$)',options_label{:});
% % ylabel('$V(r)$  ($\epsilon$)',options_label{:});
% xlabel('$r/\sigma$',options_label{:});
% ylabel('$F(r)/F_0$',options_label{:});
% box on;
% drawnow;
% 
% 
% figure('Position',[50 50 Xpix Ypix]);
% axes('Position',[bxl 0 xwi 0]/Xpix+[0 byb 0 ywi]/Ypix);
% hold on;
% plot(x/sigma,V/epsilon,'-k');
% plot(x/sigma,F/epsilon,'-r');
% plot([0 3],[0 0],':k');
% hold off;
% xlim([0 3]);
% ylim([-3 5]);
% % xlabel('$r$  ($\sigma$)',options_label{:});
% % ylabel('$V(r)$  ($\epsilon$)',options_label{:});
% xlabel('$r/\sigma$',options_label{:});
% ylabel('$V(r)/\epsilon$ \ \ \ \   $F(r)/F_0$',options_label{:});
% box on;
% drawnow;





