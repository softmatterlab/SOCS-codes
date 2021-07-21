clear all; close all; clc; 

figure_pos = [0 0 1000 260];

axes_pos = [[8 10 240 240]; 
            [256 10 240 240];
            [504 10 240 240]; 
            [752 10 240 240]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


N0 = 10;
bc0  = 0; % NO periodic boundary conditions
bc0  = 1; % periodic boundary conditions
Nx = N0;
Ny = N0;
Xpix = 50*Nx;
Ypix = 50*Ny;
cx=[5 4 10];
cy=[4 10 2];
color_center = c(3,:);
color_neighbours = c(1,:);




axes(a(1));

m = zeros(Ny, Nx);
for i=1:numel(cx)   
    m(cy(i),cx(i)) = 1;
end
bc = 0;
[ m_nb ] = calc_neighbours( m, bc );
m_nb(m_nb>=1) = 1;
[by, bx] = find(m_nb==1);

for i=1:numel(bx)   
    fill(bx(i)+0.5*[1 1 -1 -1 1],by(i)+0.5*[1 -1 -1 1 1],color_neighbours,'edgecolor','none');
end
for i=1:numel(cx)
    fill(cx(i)+0.5*[1 1 -1 -1 1],cy(i)+0.5*[1 -1 -1 1 1],color_center,'edgecolor','none');
end

for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end

xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
fill([0 1 1 0 0]*1.4+0.8,8.8+[0 0 1 1 0]*1.6,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
%set(gca,'Xtick',[],'Ytick',[]);
axis off;


axes(a(2));

m = zeros(Ny, Nx);
for i=1:numel(cx)   
    m(cy(i),cx(i)) = 1;
end
bc = 1;
[ m_nb ] = calc_neighbours( m, bc );
m_nb(m_nb>=1) = 1;
[by, bx] = find(m_nb==1);

for i=1:numel(bx)   
    fill(bx(i)+0.5*[1 1 -1 -1 1],by(i)+0.5*[1 -1 -1 1 1],color_neighbours,'edgecolor','none');
end
for i=1:numel(cx)
    fill(cx(i)+0.5*[1 1 -1 -1 1],cy(i)+0.5*[1 -1 -1 1 1],color_center,'edgecolor','none');
end

for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end

xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
fill([0 1 1 0 0]*1.4+0.8,8.8+[0 0 1 1 0]*1.6,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
%set(gca,'Xtick',[],'Ytick',[]);
axis off;





axes(a(3));
bc = 0;

color_alive = c(1,:);
color_dead = [0.3 0.3 0.3];

size_alive = 10;

m = randi(2,Ny,Nx)-1;
m_nb = calc_neighbours( m, bc );
m_new = rule_gameoflife( m, m_nb );

new_cells = m_new-m;
new_cells(new_cells<=0) = 0;

death_cells = m-m_new;
death_cells(death_cells<=0) = 0;

diff_cells = m-m_new;
surviving_cells = 0*m;
surviving_cells(diff_cells==0) = 1;

[yb,xb] = find(m > 0);
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hb = plot(xb,yb,'o','color',color_alive,'Markerfacecolor',...
    color_alive,'Markersize',size_alive);
hold on;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
fill([0 1 1 0 0]*1.4+0.8,8.8+[0 0 1 1 0]*1.6,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis off;




axes(a(4));
% m = randi(2,Ny,Nx)-1;
% m_nb = calc_neighbours( m, bc );
% m_new = rule_gameoflife( m, m_nb );
% 
% new_cells = m_new-m;
% new_cells(new_cells<=0) = 0;
% 
% death_cells = m-m_new;
% death_cells(death_cells<=0) = 0;
% 
% diff_cells = m-m_new;
% surviving_cells = 0*m;
% surviving_cells(diff_cells==0) = 1;

[yb,xb] = find(m_new > 0);
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hb = plot(xb,yb,'o','color',color_alive,'Markerfacecolor',...
    color_alive,'Markersize',size_alive);
[ri,co] = find(death_cells==1);
plot(co,ri,'x','color',color_dead, 'MarkerSize', size_alive,'LineWidth',2, 'MarkerFaceColor', color_dead);
[ri,co] = find(new_cells==1);
plot(co,ri,'o','color',c(3,:), 'MarkerSize', size_alive, 'MarkerFaceColor',c(3,:));
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
fill([0 1 1 0 0]*1.4+0.8,8.8+[0 0 1 1 0]*1.6,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
axis off;
