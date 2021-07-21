clear all; close all; clc;

figure_pos = [0 0 800 440];

axes_pos = [[10 80 350 350]; 
            [440 80 350 350]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));
x = 0.5*cos(0:0.01:2*pi);
y = 0.5*sin(0:0.01:2*pi);
for i = 1:100
    cc = 1 - (1-[0.9 0.1 0])*(i/100)^1.5;
    fill(x*(100-i),y*(100-i),cc,'EdgeColor',cc)
end
load('1robottraj.mat');
plot(x(1:10:end)*50,y(1:10:end)*50,'Color',c(1,:),'LineWidth',2);
xlim([-59 59])
ylim([-59 59])
axis('off')




axes(a(2));

load('1robotnodelay.mat');
plot(mean(r),'Color',c(1,:),'LineWidth',2)

load('1robot5tau.mat');
plot(mean(r),'Color',c(4,:),'LineWidth',2)

load('1robotneg5tau.mat');
plot(mean(r),'Color',c(3,:),'LineWidth',2)

set(gca,'xTick',[],'yTick',[])
labels('$t$','$\langle r(t) \rangle $')
legend('$\delta = 0$','$\delta = 5\tau$','$\delta=-5\tau$','FontSize',18,'Interpreter','latex','box','off','location','north')