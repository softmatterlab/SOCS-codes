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
fill(x,y,c(1,:),'EdgeColor',c(1,:))
plot([0 1 0.8 1 0.9],[0 1 0.9 1 0.8],'k','LineWidth',2)
x = 0.8*cos(0:0.01:0.25*pi); y = 0.8*sin(0:0.01:0.25*pi);
plot(x,y,'k--')
text(0.9,0.4,'$\phi$','FontSize',20,'Interpreter','latex')
text(0.9,1.4,'$v$','FontSize',20,'Interpreter','latex')
plot([0 0],[-2 2],'k--')
plot([-2 2],[0 0],'k--')


xlim([-3, 3])
ylim([-3, 3])

axis('off')


axes(a(2));
a(2).TickLabelInterpreter = 'latex';
l = 0:0.1:5;
plot(l,exp(-l)*0.9 +0.1,'k','LineWidth',2)
plot([0 5],[0.1  0.1],'k--')
set(gca,'YTick',[0.1 1],'yTicklabel',{'$V_{\inf}$','$V_0$'},'FontSize',18);
xlim([0 5.1]);
ylim([0 1.1]);
labels('$I$ (mW)','$V$')