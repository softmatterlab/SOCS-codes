% Forest Fires
%

clear all;
close all;
clc;

f = 0.05;  % probability a lightning strikes somewhere
p = 0.01;  % probability a tree is grown

% dimension of the domain
Nx = 16;
Ny = 16;  

color_tree = [0 0.6 0.4];
color_fire = [1 0.2 0];
color_lightning = [1 0.8 0];

mf = 2.5;
size_tree = mf*9;
size_fire = mf*9;
size_lightning = mf*9;


outdir = [ '.' filesep 'FF_N' num2str(Nx,'%d') '_p' num2str(p,'%8.6f')  '_f' num2str(f,'%8.6f') filesep ];

% big fires
% i = 122; % big fire, pcb effect present but not superclear
% i = 472; % All forest burns!
% i = 551; % big fire, pbc are evident

% average fires
i = 192; % % NICE, pbc effect is evident


% small and middle size fires
%i = 213; % NICE, pbc effect is evident
%i = 215; % pbc effect is evident
%i = 517; % no pbc effect shown


load(['iteration_192.mat'],...
    'xc','yc','xb','yb','xl0','yl0','Nx','Ny');


hf = figure('Position',[50 50 600 600]);
axes('Position',[0 0 1 1]);
xlim([1, Nx]+0.5*[-1 1]);
ylim([1, Ny]+0.5*[-1 1]);
hold on;
drawnow;
hf_before = figure('Position',[50 50 600 600]);
axes('Position',[0 0 1 1]);
xlim([1, Nx]+0.5*[-1 1]);
ylim([1, Ny]+0.5*[-1 1]);
hold on;
drawnow;



counter = 0;

figure(hf);
cla;
drawnow;
hold on;
%hll = plotlatticelines(Nx,Ny);
% site with fire
fill(xl0+[-1 -1 1 1 -1]*0.5,yl0+[1 -1 -1 1 1]*0.5,color_lightning);
% plot lattice lines
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hw = plot(xc,yc,'^','color',color_tree,'Markerfacecolor',...
    color_tree,'Markersize',size_tree);
hb = plot(xb,yb,'d','color',color_fire,'Markerfacecolor',...
    color_fire,'Markersize',size_fire);
%hle = plot(posl(i,1),posl(i,2),'v','color',color_lightning,...
%    'Markerfacecolor',color_lightning,'Markersize',size_lightning);
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
set(gca,'Xtick',[],'Ytick',[]);
drawnow;
saveas(gcf,['forest_fire_'  num2str(i,'%d') ],'fig' );
saveas(gcf,['forest_fire_'  num2str(i,'%d') ],'epsc' );



figure(hf_before);
cla;
drawnow;
hold on;
%hll = plotlatticelines(Nx,Ny);
% plot lattice lines
for ir = 0:Nx
    plot([1, Nx]+0.5*[-1 1],[0 0]+ir+0.5,'k');
end
for ic = 0:Ny
    plot([0 0]+ic+0.5,[1, Ny]+0.5*[-1 1],'k');
end
hw = plot(xc,yc,'^','color',color_tree,'Markerfacecolor',...
    color_tree,'Markersize',size_tree);
%                 hb = plot(xb,yb,'^','color',color_fire,'Markerfacecolor',...
%                     color_fire,'Markersize',size_fire);
%                 hle = plot(posl(i,1),posl(i,2),'v','color',color_lightning,...
%                     'Markerfacecolor',color_lightning,'Markersize',size_lightning);
hold off;
xlim([1, Nx]+0.6*[-1 1]);
ylim([1, Ny]+0.6*[-1 1]);
set(gca,'Xtick',[],'Ytick',[]);
drawnow;


saveas(gcf,['before_fire_'  num2str(i,'%d') ],'fig' );
saveas(gcf,['before_fire_'  num2str(i,'%d') ],'epsc' );

return

%