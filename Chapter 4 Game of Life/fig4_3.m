% Fig 2 rule 184

clear all;
close all;
clc;

% colors used by Aykut
colo{1} = [0    0.5647    0.7020];
colo{2} = [0.2039    0.7059         0];
colo{3} = [0.9020    0.4235         0];
colo{4} = [0.9490    0.8275    0.0784];


L=10;

Lx = L;
Ly = L;

% sequence
sequence = [  0 0 1 0 1 1 0 1 1 0 1 0 0 1 0];

xs_pos = (1:numel(sequence))*Lx;
ys_pos = 0*xs_pos;

% here: just preparation to generate the figure %%%%%%%%%%%%%%%%%%%%%%%
% traffic flow single lane
xt_pos = xs_pos;
yt_pos = ys_pos+Ly;


% particle deposition
xd0_pos = xs_pos(1)+0.5*L;
yd0_pos = ys_pos(1)+Ly;

v{1} = [1*Lx,  1*Ly];
v{2} = [1*Lx, -1*Ly];

xd_pos(1) = xd0_pos;
yd_pos(1) = yd0_pos;
for i=2:numel(xs_pos)
    xd_pos(i) = xd_pos(i-1)+v{sequence(i)+1}(1);
    yd_pos(i) = yd_pos(i-1)+v{sequence(i)+1}(2);
end

yd_pos_min = min(yd_pos);
yd_pos = yd_pos-yd_pos_min+Ly;

xdb_pos = xd_pos;
ydb_pos = yd_pos+sqrt(2)*Ly/2;

xdb_pos_ini = xdb_pos(1)-0.5*v{sequence(1)+1}(1);
ydb_pos_ini = ydb_pos(1)-0.5*v{sequence(1)+1}(1);

xdb_pos = [xdb_pos_ini xdb_pos];
ydb_pos = [ydb_pos_ini ydb_pos];

% ballistic annihilation
xb_pos = xs_pos(1:end-1)+0.5*L;
yb_pos = ys_pos(1:end-1)+Ly;

particle_to_left = 0*xb_pos;
particle_to_right = 0*xb_pos;

for i=1:(numel(xs_pos)-1)
    
    if (sequence(i)==0) && (sequence(i+1)==0)
        particle_to_right(i) = 1;
    end
    
    if (sequence(i)==1) && (sequence(i+1)==1)
        particle_to_left(i) = 1;
    end
    
end

%% now plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mf = 4;
Xpix = 640;

% find dimensions

% traffic lane
Xpix0 = mf*(numel(sequence)+2)*Lx;
Ypix0 = mf*2.5*Ly;
Ypix_t = Ypix0/Xpix0*Xpix;

% ballistic annihilation
Xpix0 = mf*(numel(sequence)+2)*Lx;
Ypix0 = mf*2.5*Ly;
Ypix_b = Ypix0/Xpix0*Xpix;

% particle deposition
Xpix0 = mf*(numel(sequence)+2)*Lx;
Ypix0 = mf*((max(yd_pos)-ys_pos(1))/Ly+1.5)*Ly;
Ypix_d = Ypix0/Xpix0*Xpix;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure:  Xpix, Ypix
% upper axes: 
%    axes('Position',[0 0 1 0]+[0 Ypix-Ypix_t 0 Ypix_t]/Ypix);
% middle axes: 
%    axes('Position',[0 0 1 0]+[0 Ypix_b+yb2 0 Ypix_d]/Ypix);
% lower axes:
%    axes('Position',[0 0 1 0]+[0 0 0 Ypix_b]/Ypix);
%


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yb1 = 30;
yb2 = 30;

Ypix = Ypix_t + yb1 + Ypix_d + yb2 + Ypix_b;

figure('Position',[50 50 Xpix Ypix],'Color','W')

%% traffic flow %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes('Position',[0 0 1 0]+[0 Ypix-Ypix_t 0 Ypix_t]/Ypix);

font_size_text = 20;
marker_color = colo{3};
marker_size = 20;
hold on;
text(15,85,'{\bf a}','Units','Pixels','Fontsize',25,'Interpreter','Latex')
% sequence with cells
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)-0.5*Ly+[0 0],'k');
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)+0.5*Ly+[0 0],'k');
for i=1:numel(xs_pos)
    plot([0 0]+xs_pos(i)-0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
end
plot([0 0]+xs_pos(end)+0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
% text
for i=1:numel(xs_pos)
    text(xs_pos(i),ys_pos(i),num2str(sequence(i)),'Interpreter','Latex','fontsize',font_size_text,...
        'HorizontalAlignment','center','VerticalAlignment','middle')
end
icar = find(sequence == 1);
plot(xt_pos(icar),yt_pos(icar),'>','color',marker_color,'Markersize',...
    marker_size,'MarkerFaceColor',marker_color);
hold off;
axis off;
xlim([xs_pos(1), xs_pos(end)]+[-1 1]*Lx);
ylim([ys_pos(1), yt_pos(1)]+0.75*[-1 1]*Ly);


%% particle deposition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
font_size_text = 20;
marker_color = colo{1};
marker_size = 30;
axes('Position',[0 0 1 0]+[0 Ypix_b+yb2 0 Ypix_d]/Ypix);
hold on;
text(15,195,'{\bf b}','Units','Pixels','Fontsize',25,'Interpreter','Latex')
% sequence with cells
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)-0.5*Ly+[0 0],'k');
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)+0.5*Ly+[0 0],'k');
for i=1:numel(xs_pos)
    plot([0 0]+xs_pos(i)-0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
end
plot([0 0]+xs_pos(end)+0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
% text
for i=1:numel(xs_pos)
    text(xs_pos(i),ys_pos(i),num2str(sequence(i)),'Interpreter','Latex','fontsize',font_size_text,...
        'HorizontalAlignment','center','VerticalAlignment','middle')
end
% plot particles as o
plot(xd_pos,yd_pos,'o','color',marker_color,'Markersize',...
    marker_size,'MarkerFaceColor',marker_color);
plot(xdb_pos,ydb_pos,'k');
hold off;
axis off;
xlim([xs_pos(1), xs_pos(end)]+[-1 1]*Lx);
ylim([ys_pos(1), max(yd_pos)]+0.75*[-1 1]*Ly);


%%  ballistic annihilation  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
font_size_text = 20;
marker_color_left = colo{1};
marker_color_right = colo{3};
marker_size = 20;
axes('Position',[0 0 1 0]+[0 0 0 Ypix_b]/Ypix);
hold on;
% sequence with cells
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)-0.5*Ly+[0 0],'k');
plot(xs_pos([1 end])+0.5*[-1 1]*Lx,ys_pos(1)+0.5*Ly+[0 0],'k');
for i=1:numel(xs_pos)
    plot([0 0]+xs_pos(i)-0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
end
plot([0 0]+xs_pos(end)+0.5*Lx,ys_pos(1)-0.5*[-1 1]*Ly,'k');
% text
for i=1:numel(xs_pos)
    text(xs_pos(i),ys_pos(i),num2str(sequence(i)),'Interpreter','Latex','fontsize',font_size_text,...
        'HorizontalAlignment','center','VerticalAlignment','middle')
end
% plot particles
ileft = find(particle_to_left == 1);
plot(xb_pos(ileft),yb_pos(ileft),'<','color',marker_color_left,'Markersize',...
    marker_size,'MarkerFaceColor',marker_color_left);
text(15,95,'{\bf c}','Units','Pixels','Fontsize',25,'Interpreter','Latex')
iright = find(particle_to_right == 1);
plot(xb_pos(iright),yb_pos(iright),'>','color',marker_color_right,'Markersize',...
    marker_size,'MarkerFaceColor',marker_color_right);
hold off;
axis off;
xlim([xs_pos(1), xs_pos(end)]+[-1 1]*Lx);
ylim([ys_pos(1), yb_pos(1)]+0.75*[-1 1]*Ly);



