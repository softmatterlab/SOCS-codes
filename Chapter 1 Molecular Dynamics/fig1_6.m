clear all; close all; clc; 

figure_pos = [0 0 600 260];

axes_pos = [[10 10 180 240]; 
            [210 10 180 240];
            [410 10 180 240]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



axes(a(1));
phi = (0:360)*pi/180;
fill(cos(phi),sin(phi),c(1,:)+ (1-c(1,:))/2,'EdgeColor',c(1,:)); hold on;
plot(cos(phi),sin(phi),'Color',c(1,:),'LineWidth',2)


rx = -0.88;
ry = 0.35;
theta = 156.13*pi/180;
xc = cos(theta);
yc = sin(theta);
rot = [[cos(theta) sin(theta)];
       [-sin(theta) +cos(theta)]];
   
rotb = [[cos(theta) -sin(theta)];
        [sin(theta) +cos(theta)]];

rix = 3*xc-2*rx;
riy = 3*yc-2*ry;
plot([rix (rix+xc)/2 (rix+xc)/2-5e-3 (rix+xc)/2 (rix+xc)/2-15e-3],[riy (riy+yc)/2 (riy+yc)/2+2e-2 (riy+yc)/2 (riy+yc)/2+12e-3],'k','LineWidth',2);
plot([rx rix],[ry riy],'k:','LineWidth',2);
plot(rix,riy,'.','Color',c(3,:),'MarkerSize',35);
plot(rx,ry,'o','Color',c(3,:),'MarkerSize',8,'LineWidth',2);

text(rix-0.02,riy+0.04,'${\bf r}_{i-1}$','Interpreter','latex','FontSize',16)
text(rx-0.01,ry-0.04,'${\bf \tilde{r}}_{i}$','Interpreter','latex','FontSize',16)
ylim(0.21+[0 0.4]);
xlim(-1.12+[0 0.3]);
axis('off')





axes(a(2));
fill(cos(phi),sin(phi),c(1,:)+ (1-c(1,:))/2,'EdgeColor',c(1,:)); hold on;
plot(cos(phi),sin(phi),'Color',c(1,:),'LineWidth',2)
plot([rx rix],[ry riy],'k:','LineWidth',2);
plot(rix,riy,'.','Color',c(3,:),'MarkerSize',35);
plot(rx,ry,'o','Color',c(3,:),'MarkerSize',8,'LineWidth',2);
plot(xc +[0.15 -0.15]*yc, yc + [-0.15 0.15]*xc,'k--','LineWidth',2);
plot(xc +[-0.15 0.15]*xc, yc + [-0.15 0.15]*yc,'k--','LineWidth',2);

text(rix-0.02,riy+0.04,'${\bf r}_{i-1}$','Interpreter','latex','FontSize',16)
text(rx-0.01,ry-0.04,'${\bf \tilde{r}}_{i}$','Interpreter','latex','FontSize',16)
text(xc+0.02,yc+0.13,'${\bf \hat{t}}$','Interpreter','latex','FontSize',16)
text(xc-0.15,yc+0.03,'${\bf \hat{n}}$','Interpreter','latex','FontSize',16)

ylim(0.21+[0 0.4]);
xlim(-1.12+[0 0.3]);
axis('off')


axes(a(3));
fc = rot*[xc;yc];
fr = rot*[rx;ry];
frrx = 2*fc(1)-fr(1);
frry = fr(2);
rr = rotb*[frrx;frry];
rrx = rr(1);
rry = rr(2);

plot([rix xc rrx],[riy yc rry],'k:','LineWidth',2)
plot([rrx (2*rrx-xc) (2*rrx-xc)+18e-3 (2*rrx-xc) (2*rrx-xc)+20e-3],[rry (2*rry-yc) (2*rry-yc)+11e-3 (2*rry-yc) (2*rry-yc)-4e-3],'k','LineWidth',2);
fill(cos(phi),sin(phi),c(1,:)+ (1-c(1,:))/2,'EdgeColor',c(1,:)); hold on;
plot(cos(phi),sin(phi),'Color',c(1,:),'LineWidth',2)
plot([xc rx],[yc ry],'k:','LineWidth',2);
plot(rix,riy,'.','Color',c(3,:),'MarkerSize',35);
plot(rrx,rry,'.','Color',c(3,:),'MarkerSize',35);
plot(rx,ry,'o','Color',c(3,:),'MarkerSize',8,'LineWidth',2);
plot(xc +[0.15 -0.15]*yc, yc + [-0.15 0.15]*xc,'k--','LineWidth',2);

text(rix-0.02,riy+0.04,'${\bf r}_{i-1}$','Interpreter','latex','FontSize',16)
text(rx-0.01,ry-0.04,'${\bf \tilde{r}}_{i}$','Interpreter','latex','FontSize',16)
text(xc+0.02,yc+0.13,'${\bf \hat{t}}$','Interpreter','latex','FontSize',16)
text(rrx-0.02,rry-0.03,'${\bf r}_{i}$','Interpreter','latex','FontSize',16)
% plot(xc +[-0.15 0.15]*xc, yc + [-0.15 0.15]*yc,'k--','LineWidth',2);

ylim(0.21+[0 0.4]);
xlim(-1.12+[0 0.3]);
axis('off')
