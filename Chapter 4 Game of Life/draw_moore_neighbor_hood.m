function [ hf ] = draw_moore_neighbor_hood( Nx, Ny, cx, cy, color_center, color_neighbours, bc, Xpix, Ypix )
%DRAW_GAMEOFLIFE Summary of this function goes here
%   Detailed explanation goes here


m = zeros(Ny, Nx);

for i=1:numel(cx)   
    m(cy(i),cx(i)) = 1;
end

[ m_nb ] = calc_neighbours( m, bc );

m_nb(m_nb>=1) = 1;

[by, bx] = find(m_nb==1);


hf = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[0 0 1 1]);
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
hold on;

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
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
%set(gca,'Xtick',[],'Ytick',[]);
axis off;
drawnow;

end

