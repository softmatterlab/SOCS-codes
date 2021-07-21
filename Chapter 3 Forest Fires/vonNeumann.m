% von Neumann neighborhood


clear all;
close all;
clc;


% dimension of the domain
Nx = 8;
Ny = 8;

r = 3;
c = 5;

hf_before = figure('Position',[50 50 600 600]);
axes('Position',[0 0 1 1]);
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
hold on;
drawnow;


color_center = [0.75 0.5 1];
color_center = [0 0.5 1];
color_neighbor = [1 0.5 0];


figure(hf_before);
cla;
drawnow;
hold on;
% plot lattice lines
fill(c+[-1 -1 1 1 -1]*0.5,r+[1 -1 -1 1 1]*0.5,color_center);
% 
fill(c+1+[-1 -1 1 1 -1]*0.5,r+[1 -1 -1 1 1]*0.5,color_neighbor);
fill(c-1+[-1 -1 1 1 -1]*0.5,r+[1 -1 -1 1 1]*0.5,color_neighbor);
fill(c+[-1 -1 1 1 -1]*0.5,r+1+[1 -1 -1 1 1]*0.5,color_neighbor);
fill(c+[-1 -1 1 1 -1]*0.5,r-1+[1 -1 -1 1 1]*0.5,color_neighbor);

for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
set(gca,'Xtick',[],'Ytick',[]);
axis off;
drawnow;






