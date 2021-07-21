clear all; close all; clc; 

figure_pos = [0 0 700 770];

axes_pos = [[80 460 600 300]
            [80 80 600 300]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



load('fig6_0.mat')
axes(a(1));


labels('$t$ [steps]','$x$')

% plot(t_r,x_r,'Color',c(4,:),'LineWidth',2);
plot(t,x,':','Color',c(1,:),'LineWidth',2);
plot(t_r,x_r,'x','Color',c(4,:),'MarkerSize',8,'LineWidth',2);
plot(t,x,'o','Color',c(1,:),'MarkerSize',10,'LineWidth',2);
xlim([0 99]);
dx = -2;
dy = 0.4;
plot(50+dx,2.8+dy,'o','Color',c(1,:),'MarkerSize',10,'LineWidth',2);
text(52+dx,2.76+dy,'Irregularly sampled trajectory','Fontsize',16,'Interpreter','Latex')
plot(50+dx,1.9+dy,'x','Color',c(4,:),'MarkerSize',10,'LineWidth',2);
text(52+dx,1.86+dy,'Regularized trajectory','Fontsize',16,'Interpreter','Latex')

axes(a(2));
x = cumsum(randn(1,99)/2);
plot(x,'Color',c(1,:),'LineWidth',2);
x = x- mean(x);
x = x/std(x);
disp(std(x));
xlim([0 99]);
ylim([-9.9 9.9]);
plot(x,'Color',c(4,:),'LineWidth',2);
plot([0 199],[0 0],'k--','LineWidth',2)
legend('Original trajectory','Normalized trajectory','FontSize',16,'Interpreter','Latex','box','off')
labels('$t$ [steps]','$x$')

