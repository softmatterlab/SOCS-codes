clear all; close all; clc;

figure_pos = [0 0 1000 330];

axes_pos = [[10 80 255 255]; 
            [360 80 255 255];
            [740 80 255 255]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

fsl = 18;
fst = 20;
fsa = 16;

optionslabel = {'Interpreter','Latex','fontsize',fsl};
optionstitle = {'Interpreter','Latex','fontsize',fst};

optionsarrow = {'stemwidth',0.02,'headwidth',0.08,'headlength',0.2,'headnode',0.2,'color','k'};


axes(a(1));
xmax = 10;
ymax = 10;
% position center sphere
x0 = xmax/2;
y0 = ymax/2;
R = 2;
s = 2;
theta_arrow = pi/4;
d = y0-R-s;
z = y0-s;
thetaang = (0:1:360)*pi/180;
fill(x0+R*cos(thetaang),y0+R*sin(thetaang),c(1,:)+(1-c(1,:))*0.6,'Edgecolor','k');
fill([0 1 1 0]*xmax,[1 1 0 0]*2,c(1,:)+(1-c(1,:))*0.6,'Edgecolor','None');
%
text(x0-0.2,y0+1,'$R$','Interpreter','Latex','Fontsize',20);
arrow2d(x0,y0,x0+R*cos(theta_arrow),y0+R*cos(theta_arrow),optionsarrow{:});
plot(x0,y0,'.k','MarkerSize',16);
% for d
text(x0+0.3,s+0.5*d,'$d$','Interpreter','Latex','Fontsize',20);
arrow2d(x0,s+0.5*d,x0,s,optionsarrow{:});
arrow2d(x0,s+0.5*d,x0,s+d,optionsarrow{:});
%
x1 = x0+R+0.5;
%
plot([x0, x1]+0.5*[-1 1],[y0 y0],'k:','LineWidth',1.5);
% for z
text(x1+0.3,s+0.5*z,'$z$','Interpreter','Latex','Fontsize',20);
arrow2d(x1,s+0.5*z,x1,s,optionsarrow{:});
arrow2d(x1,s+0.5*z,x1,y0,optionsarrow{:});
hold off
axis off
xlim([0 xmax]);
ylim([0 ymax]);

axes(a(2));
load('data_fig4_b.mat','ratio_s2s_radius','finv_perp_LS_0','finv_par_LS_0');
plot(ratio_s2s_radius,finv_perp_LS_0,'Color',c(1,:),'LineWidth',2);
plot(ratio_s2s_radius,finv_par_LS_0,'k--','LineWidth',2);
legend('$D_{\perp}$','$D_{\|}$','fontsize',16,'Location','SouthEast','box','off','Interpreter','latex');
ylim([0 1]);
xlim(ratio_s2s_radius([1 end]));
labels('$d/R$','$D_{\perp}$, $D_{\|}$ $[D_{\rm SE}]$');
set(gca,'xscale','log')


axes(a(3));
load('data_fig4_c.mat','s2s_range_der','spuriousdrift_perp_LS_1','strleg',...
    'list_radii','str_radii','list_Dbulk','eta','T');
t = 1;
for  i=[1 2 4 6]
    plot(s2s_range_der*1e+6,spuriousdrift_perp_LS_1{i}*1e+6,'color',c(t,:),'LineWidth',2);
    t = t+1;
end
legend(strleg{[1 2 4 6]},'Location','SouthWest','fontsize',12,...'Orientation','horizontal',
    'NumColumns',2,'box','off');
xlim(s2s_range_der([1 end])*1e+6);
labels('$d$ $[\mu {\rm m}]$','$\partial D_{\perp}(z)/\partial z$ $[\mu {\rm m}\, {\rm s}^{-1}]$');
set(gca,'xscale','log','yscale','log')
