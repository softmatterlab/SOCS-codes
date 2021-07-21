clear all; close all; clc; 
figure_pos = [0 0  1000 380];

axes_pos = [[0 70 300 300]; 
            [320 70 300 300];
            [690 70 300 300]];


[h,a] = initfig(figure_pos,axes_pos);
colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = [];
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

R = 1;
phi=-pi:0.01:pi;
phi = [phi phi(end)];

axes(a(1));
x = [-3 3];
y = [0 0];
fill(R*sin(phi)+x(1),R*cos(phi)+y(1),c(1,:));
fill(R*sin(phi)+x(2),R*cos(phi)+y(2),c(1,:));
xlim([-5 5]);
ylim([-4 6]);
theta = 0;
f = 1.5;
plot(x(1)+(1.1+[0 f])*cos(theta),y(1)+(1.1+[0 f])*sin(theta),'Color',c(4,:),'LineWidth',3)
plot(x(1)+(1.1+f+[-.4 0 -.4]).*cos(theta+[.1 0 -.1]),y(1)+(1.1+f+[-.4 0 -.4]).*sin(theta+[.1 0 -.1]),'Color',c(4,:),'LineWidth',3)
theta = theta+pi;
plot(x(2)+(1.1+[0 f])*cos(theta),y(2)+(1.1+[0 f])*sin(theta),'Color',c(4,:),'LineWidth',3)
plot(x(2)+(1.1+f+[-.4 0 -.4]).*cos(theta+[.1 0 -.1]),y(2)+(1.1+f+[-.4 0 -.4]).*sin(theta+[.1 0 -.1]),'Color',c(4,:),'LineWidth',3)
text(-1.5,1.1,'$v_{\rm p}$','Fontsize',18,'Interpreter','latex')
text(0.9,1.1,'$v_{\rm p}$','Fontsize',18,'Interpreter','latex')
5
% for i=[1 3]
%     theta = atan2(-y(2)+y(i),-x(2)+x(i));
%     f = 50/((x(2)-x(i))^2 + (y(2)-y(i))^2);
%     plot(x(2)+(1.1+[0 f])*cos(theta),y(2)+(1.1+[0 f])*sin(theta),'Color',c(4,:),'LineWidth',2)
% end
axis('off')



axes(a(3));
p = 6:0.05:8;
l = 2:0.05:6;
s = 1:0.05:2;
plot(l,l.^-2,'Color',c(1,:),'Linewidth',2);
plot(p,p*0,'Color',c(1,:),'Linewidth',2);
plot(s,s.^-2,'--','Color',c(1,:),'Linewidth',2);
plot([2 2],[0 0.25],'k--','Linewidth',1)
plot([6 6],[0 1/36],'k--','Linewidth',1)
ylim([0 .4])
labels('r','$v_{\rm p}(r)$');
set(gca,'yTick',[],'xTick',[2 6],'xTicklabel',{'$2R$','$r_c$'},'Fontsize',16,'TickLabelInterpreter','latex')



axes(a(2));
x = rand(1,10)*20;
y = rand(1,10)*20;
fill(R*sin(phi)+10,R*cos(phi)+10,c(1,:));
plot(10+6*sin(phi),10+6*cos(phi),'k:','LineWidth',2)

for i = 1:10
    if (x(i)-10)^2+(y(i)-10)^2 < 36
        fill(R*sin(phi)+x(i),R*cos(phi)+y(i),c(4,:));
    else
        fill(R*sin(phi)+x(i),R*cos(phi)+y(i),[.9 .9 .9],'EdgeColor',[0.8 0.8 0.8]);
    end
end

xlim([-1 21]);
ylim([-1 21]);
axis('off')


