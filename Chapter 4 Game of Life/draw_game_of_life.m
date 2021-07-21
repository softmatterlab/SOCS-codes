function [ hf ] = draw_game_of_life( Nx, Ny, m, color_alive, size_alive, Xpix, Ypix )
%DRAW_GAMEOFLIFE Summary of this function goes here
%   Detailed explanation goes here
%   

[yb,xb] = find(m > 0);
hf = figure('Position',[50 50 Xpix Ypix]);
axes('Position',[0 0 1 1]);
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
hold on;
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hb = plot(xb,yb,'o','color',color_alive,'Markerfacecolor',...
    color_alive,'Markersize',size_alive);
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
%set(gca,'Xtick',[],'Ytick',[]);
axis off;
drawnow;

end

