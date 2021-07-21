clear all; close all; clc; 

figure_pos = [0 0 1000 370];

axes_pos = [[10 10 290 290]; 
            [360 10 290 290];
            [700 10 290 290]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));
x = [-1 0 0 1];
y = [0 -1 1 0];
for i=1:length(x)
        fill([0 0 1 1 0]+x(i),[0 1 1 0 0]+y(i),c(4,:),'EdgeColor',c(1,:))
end

for i= 1:4
    plot([1 1]*(i-2),[-1 2],'k','LineWidth',2);
    plot([-1 2],[1 1]*(i-2),'k','LineWidth',2);   
end
plot(0.5,0.5,'.','Color',c(1,:),'MarkerSize',60);
title('Diffusion','FontSize',18,'Interpreter','latex');
text(-0.55,2.3,'Probability$=d$','FontSize',18,'Interpreter','latex')




xlim([-1.6,2.6]);
ylim([-1.6,2.6]);
axis('off')




axes(a(2));
plot([0 0 1 1 0]*2-3,[0 1 1 0 0]*2-1,'k','LineWidth',2)
plot([0 0 1 1 0]*2+1,[0 1 1 0 0]*2-1,'k','LineWidth',2)
plot(-2.4,0.4,'.','Color',c(1,:),'MarkerSize',60);
plot(-1.6,0.4,'.','Color',c(4,:),'MarkerSize',60);
plot(-1.6,-0.4,'.','Color',c(1,:),'MarkerSize',60);
plot(-2.4,-0.4,'.','Color',c(3,:),'MarkerSize',60);

plot(1.6,0.4,'.','Color',c(4,:),'MarkerSize',60);
plot(2.4,0.4,'.','Color',c(4,:),'MarkerSize',60);
plot(2.4,-0.4,'.','Color',c(4,:),'MarkerSize',60);
plot(1.6,-0.4,'.','Color',c(3,:),'MarkerSize',60);
plot([0 1.6 1.2 1.6 1.2]-0.8,[0 0 -0.2 0 0.2],'k','LineWidth',3);

title('Infection','FontSize',18,'Interpreter','latex');
text(-1.6,2.72,'Probability$=\beta$','FontSize',18,'Interpreter','latex')
xlim([-3.2,3.2]);
ylim([-3.2,3.2]);
axis('off');


axes(a(3));
plot(-1.3,0,'.','Color',c(4,:),'MarkerSize',60);
plot(1.3,0,'.','Color',c(3,:),'MarkerSize',60);
plot([0 1.6 1.2 1.6 1.2]-0.8,[0 0 -0.2 0 0.2],'k','LineWidth',3);
title('Recovery','FontSize',18,'Interpreter','latex');
text(-1.5,2.72,'Probability$=\gamma$','FontSize',18,'Interpreter','latex')
xlim([-3.2,3.2]);
ylim([-3.2,3.2]);
axis('off')

