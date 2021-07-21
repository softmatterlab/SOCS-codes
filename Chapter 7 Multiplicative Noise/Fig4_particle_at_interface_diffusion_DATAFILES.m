% particle near a planar interface
%
% Reference for spurious drift:
% https://iopscience.iop.org/article/10.1088/0034-4885/79/5/053901
% Effective drifts in dynamical systems with multiplicative noise: a review of recent progress
% Giovanni Volpe and Jan Wehr
%

clear all;
close all;
clc;



colo{1} = [0    0.5647    0.7020];
colo{2} = [0.2039    0.7059         0];
colo{3} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];
colo{5} = [0.8275    0.0784    0.9490];
colo{6} = [0.0784    0.9490    0.8275];
colo{7} = [0.0784    0.8275    0.9490];
colo{8} = [0.8275    0.9490    0.0784];





% three horizontal panels

xwi1 = 300;
xwi2 = 300;
xwi3 = xwi2;
ywi = 300;
by1 = 60;
by2 = 20;
bx1 = 20;
bx2 = 80;
bx3 = 80;
bx4 = 20;
Xpix = bx1+xwi1+bx2+xwi2+bx3+xwi3+bx4;
Ypix = by1+ywi+by2;

fh=figure('Position',[50 50 Xpix Ypix]);
% panel a
ah(1)=axes('Position',[bx1 0 xwi1 0]/Xpix+[0 by1 0 ywi]/Ypix);
% panel b
ah(2)=axes('Position',[bx1+xwi1+bx2 0 xwi2 0]/Xpix+[0 by1 0 ywi]/Ypix);
% panel c
ah(3)=axes('Position',[bx1+xwi1+bx2+xwi2+bx3 0 xwi3 0]/Xpix+[0 by1 0 ywi]/Ypix);



% options for figures
fsl = 18;
fst = 20;
fsa = 16;

optionslabel = {'Interpreter','Latex','fontsize',fsl};
optionstitle = {'Interpreter','Latex','fontsize',fst};

optionsarrow = {'stemwidth',0.02,'headwidth',0.08,'headlength',0.2,'headnode',0.2,'color','k'};

%% setup
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
figure(fh);
set(gcf,'CurrentAxes',ah(1));
hold on
fill(x0+R*cos(thetaang),y0+R*sin(thetaang),[0 0 0]+0.75,'Edgecolor','k');
fill([0 1 1 0]*xmax,[1 1 0 0]*2,[0 0 0]+0.75,'Edgecolor','None');
%
text(x0+0.1,y0+1,'$R$','Interpreter','Latex','Fontsize',20);
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


%% diffusion
figure(fh);
set(gcf,'CurrentAxes',ah(2));
load('data_fig4_b.mat','ratio_s2s_radius','finv_perp_LS_0','finv_par_LS_0');

hold on;
plot(ratio_s2s_radius,finv_perp_LS_0,'k','LineWidth',2);
plot(ratio_s2s_radius,finv_par_LS_0,'k--','LineWidth',2);
hold off;
box on;
legend('D perp','D par','Location','SouthEast');
ylim([0 1]);
xlim(ratio_s2s_radius([1 end]));
ylabel('$D_{\perp}$, $D_{||}$ $[D_{\rm bulk}]$',optionslabel{:});
xlabel('$d/R$',optionslabel{:});
set(gca,'xscale','log','fontsize',fsa);
%title('coefficient (diffusion), parallel',optionstitle{:});
drawnow;




%% spurious drift
% 
figure(fh);
set(gcf,'CurrentAxes',ah(3));
%
% load data
load('data_fig4_c.mat','s2s_range_der','spuriousdrift_perp_LS_1','strleg',...
    'list_radii','str_radii','list_Dbulk','eta','T');
%
hold on;
for  i=1:numel(list_radii)
    plot(s2s_range_der*1e+6,spuriousdrift_perp_LS_1{i}*1e+6,'color',colo{i},'LineWidth',2);
end
hold off;
box on;
legend(strleg{:},'Location','SouthWest','fontsize',fsa,...'Orientation','horizontal',
    'NumColumns',2);
xlim(s2s_range_der([1 end])*1e+6);
ylabel('$\partial D_{\perp}(z)/\partial z$ $[\mu {\rm m}\, {\rm s}^{-1}]$',optionslabel{:});
xlabel('$d$ $[\mu {\rm m}]$',optionslabel{:});
set(gca,'xscale','log','yscale','log','fontsize',fsa);
drawnow;

saveas(gcf,'Fig04_Ch07','fig');






