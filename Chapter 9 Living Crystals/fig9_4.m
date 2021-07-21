clear all; close all; clc; 
figure_pos = [0 0 800 250];

axes_pos = [[0 0 250 250]; 
    [270 0 250 250]
    [550 0 250 250]];


[h,a] = initfig(figure_pos,axes_pos);
colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = [];
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


R = 1;
phi=-pi:0.01:pi;
phi = [phi phi(end)];


axes(a(1))
d = 0.55;
fill(R*sin(phi)+d,R*cos(phi)+d,c(1,:));
fill(R*sin(phi)-d,R*cos(phi)-d,c(1,:));
plot([-1 1]*d,[-1 1]*d,'k.','Markersize',20)

plot([-1 -3]*d,[-1 1]*d,'k:','LineWidth',1.5)
plot([1 -1]*d,[1 3]*d,'k:','LineWidth',1.5)
plot([-3 -1]*d,[1 3]*d,'k','LineWidth',2)
plot([-2.8 -3 -2.6]*d, [1.4 1 1.2]*d,'k','LineWidth',2)
plot([-1.2 -1 -1.4]*d, [2.6 3 2.8]*d,'k','LineWidth',2)
text(-1.8,0.9,'$r_{ij}<2R$','Rotation',45,'FontSize',16,'Interpreter','latex')


plot(R*sin(phi)+d,R*cos(phi)+d,'k');
xlim([-1 1]*2.5)
ylim([-1 1]*2.5)
axis('off')



axes(a(2));
d = 0.55;
fill(R*sin(phi)+d,R*cos(phi)+d,c(1,:));
fill(R*sin(phi)-d,R*cos(phi)-d,c(1,:));
plot([-1 1]*d,[-1 1]*d,'k.','Markersize',20)


plot([-2.5 2.5]*d,[-2.5 2.5]*d,'k:','LineWidth',1.5)
plot([-2.5 -3.5]*d,[-2.5 -3.5]*d,'Color',c(4,:),'LineWidth',2)
plot([-3.3 -3.5 -3.1]*d, [-3.1 -3.5 -3.3]*d,'Color',c(4,:),'LineWidth',2)
plot(-[-2.5 -3.5]*d,-[-2.5 -3.5]*d,'Color',c(4,:),'LineWidth',2)
plot(-[-3.3 -3.5 -3.1]*d, -[-3.1 -3.5 -3.3]*d,'Color',c(4,:),'LineWidth',2)

% text(-1.8,0.9,'$r_{ij}<2R$','Rotation',45,'FontSize',16,'Interpreter','latex')


plot(R*sin(phi)+d,R*cos(phi)+d,'k');
xlim([-1 1]*2.5)
ylim([-1 1]*2.5)
axis('off')



axes(a(3))
d = 1/sqrt(2);
fill(R*sin(phi)+d,R*cos(phi)+d,c(1,:));
fill(R*sin(phi)-d,R*cos(phi)-d,c(1,:));
plot([-1 1]*d,[-1 1]*d,'k.','Markersize',20)

plot([-1 -3]*d,[-1 1]*d,'k:','LineWidth',1.5)
plot([1 -1]*d,[1 3]*d,'k:','LineWidth',1.5)
plot([-3 -1]*d,[1 3]*d,'k','LineWidth',2)
plot([-2.8 -3 -2.6]*d, [1.4 1 1.2]*d,'k','LineWidth',2)
plot([-1.2 -1 -1.4]*d, [2.6 3 2.8]*d,'k','LineWidth',2)
text(-1.7,0.7,'$r_{ij}=2R$','Rotation',45,'FontSize',16,'Interpreter','latex')


xlim([-1 1]*2.5)
ylim([-1 1]*2.5)
axis('off')


