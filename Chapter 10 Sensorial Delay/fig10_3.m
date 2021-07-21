clear all; close all; clc;
set(groot,'defaultAxesTickLabelInterpreter','latex');  
figure_pos = [0 0 900 370];

axes_pos = [[50 70 240 240]; 
            [350 70 240 240];
            [650 70 240 240]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


load('I.mat');
I = cumsum(x);
delta = 14;
I = I(22:41);
xl = [-2, 40];
yl = [35, 75];


axes(a(1));
set(gca,'FontSize',20)
plot(I,'k.','MarkerSize',15)
plot(length(I)*[1 1],[yl(1) I(end-0)],'k:','LineWidth',1)
plot([xl(1) length(I)],[1 1]*I(end-0),'k:','LineWidth',1)
plot(length(I)-0,I(end-0),'.','Color',c(1,:),'MarkerSize',35)

title('No Delay','FontSize',18,'Interpreter','Latex');
set(gca,'yTick',[I(end-0)],'xTick',[length(I)-0],'xTickLabel','$t$','yTickLabel','$I(t)$');
ytickangle(90)
ylim([yl(1) yl(2)]);
xlim([xl(1) xl(2)]);
% labels('$t$','$I(t)$')

axes(a(2));
set(gca,'FontSize',20)
plot(I,'k.','MarkerSize',15)
plot((length(I)-delta)*[1 1],[yl(1) I(end-delta)],'k:','LineWidth',1)
plot([xl(1) length(I)-delta],[1 1]*I(end-delta),'k:','LineWidth',1)
plot(length(I)-delta,I(end-delta),'.','Color',c(4,:),'MarkerSize',35)
% plot()
title('Positive Delay','FontSize',18,'Interpreter','Latex');
set(gca,'yTick',[I(end-delta)],'xTick',[length(I)-delta length(I)],'xTickLabel',{'$t-\delta$','t'},'yTickLabel','$I(t-\delta)$');
ytickangle(90)
ylim([yl(1) yl(2)]);
xlim([xl(1) xl(2)]);



axes(a(3));
set(gca,'FontSize',20)
plot(I,'k.','MarkerSize',15)
plot((length(I)+delta)*[1 1],[yl(1) I(end)+delta*(I(end)-I(end-1))],'k:','LineWidth',1)
plot([xl(1) length(I)+delta],[1 1]*I(end)+delta*(I(end)-I(end-1)),'k:','LineWidth',1)
plot(length(I)+[-1 delta],I(end)+[-1 delta]*(I(end)-I(end-1)),'--','Color',c(3,:),'LineWidth',1)
plot(length(I)+delta,I(end)+delta*(I(end)-I(end-1)),'.','Color',c(3,:),'MarkerSize',35)
% plot()
title('Negative Delay','FontSize',18,'Interpreter','Latex');
set(gca,'yTick',[I(end)+delta*(I(end)-I(end-1))],'xTick',[length(I) length(I)+delta],'xTickLabel',{'t','$t-\delta$'},'yTickLabel','$I(t)-\delta I^\prime (t)$');
ytickangle(90)
ylim([yl(1) yl(2)]);
xlim([xl(1) xl(2)]);