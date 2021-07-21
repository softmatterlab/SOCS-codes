clear all; close all; clc; 

figure_pos = [0 0 960 330];

axes_pos = [[10 80 290 240]; 
            [390 80 240 240];
            [710 80 240 240]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end




axes(a(1));

fill([-1 1 1 -1 -1], [-1 -1 1 1 -1]-2,c(1,:))
fill([-1 1 1 -1 -1], [-1 -1 1 1 -1]+2,c(1,:))
fill([-1 1 1 -1 -1]-2, [-1 -1 1 1 -1],c(1,:))
fill([-1 1 1 -1 -1]+2, [-1 -1 1 1 -1],c(4,:))
fill([-1 1 1 -1 -1], [-1 -1 1 1 -1],c(3,:))

plot([0 0 -.2 0 .2], [-.6 .6 .3 .6 .3]-2,'k','LineWidth',2)
plot([0 0 -.2 0 .2]-2, [-.6 .6 .3 .6 .3],'k','LineWidth',2)
plot([0 0 -.2 0 .2], [-.6 .6 .3 .6 .3]+2,'k','LineWidth',2)
plot([0 0 -.2 0 .2]+2,-[-.6 .6 .3 .6 .3],'k','LineWidth',2)

plot([0 0 -.3 0 .3]-4,[-.6 .6 .3 .6 .3]*2-1,'k','LineWidth',4)

text(-.3,0.1,' \bf $\sigma_{ij}$','Interpreter','Latex','FontSize',22)
text(-4.4,-2.8,' \bf $H$','Interpreter','Latex','FontSize',22)

plot([-1 1 1 -1 -1],[-3 -3 3 3 -3],'k','LineWidth',2)
plot([-3 -3 3 3 -3],[-1 1 1 -1 -1],'k','LineWidth',2)



xlim([-4.53 3.2]);
ylim([-3.2 3.2]);
axis('off')



axes(a(2));

labels('$\sigma_{ij}$','$E(\sigma_{ij})$');
bar(1,-4,'facecolor',c(1,:));
bar(-1,-1,'facecolor',c(4,:));
set(gca,'xtick',[-1 1]);
xlim([-2.5 2.5])
ylim([-4.9 0])


axes(a(3));

labels('$\sigma_{ij}$','$p(\sigma_{ij})$');
pp = exp(4/5)/(exp(4/5)+exp(1/5));
pm = exp(1/5)/(exp(4/5)+exp(1/5));
bar(1,pp,'facecolor',c(1,:));
bar(-1,pm,'facecolor',c(4,:));
pp = exp(4/1)/(exp(4/1)+exp(1/1));
pm = exp(1/1)/(exp(4/1)+exp(1/1));
plot(1,pp,'.','color',c(1,:)/2,'Markersize',28)
plot(-1,pm,'.','color',c(4,:)/2,'Markersize',28)
set(gca,'xtick',[-1 1]);
xlim([-2.5 2.5])
ylim([0 0.99]);

