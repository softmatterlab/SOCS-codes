% Fig 1 rules of game of life

clear all;
close all;
clc;

dirout = ['Fig4' filesep];
mkdir(dirout);

save_file = false;
save_file = true;

N0 = 10;
bc0  = 0; % NO periodic boundary conditions
bc0  = 1; % periodic boundary conditions

Nx = N0;
Ny = N0;

Xpix = 50*Nx;
Ypix = 50*Ny;

cx=[5 4 10];
cy=[4 10 2];
color_center = [1 0.5 0];
color_neighbours = [0 0.5 1];


bc = 0;
[ hf1 ] = draw_moore_neighbor_hood( Nx, Ny, cx, cy, color_center, color_neighbours, bc, Xpix, Ypix );
bc = 1;
[ hf2 ] = draw_moore_neighbor_hood( Nx, Ny, cx, cy, color_center, color_neighbours, bc, Xpix, Ypix );



%%
bc = 0;

color_alive = [0 0 0];
color_dead = [0 0 0]+0.8;

size_alive = 40;

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



[ hf3 ] = draw_game_of_life( Nx, Ny, m, color_alive, size_alive, Xpix, Ypix );

[ hf4 ] = draw_game_of_life( Nx, Ny, m_new, color_alive, size_alive, Xpix, Ypix );
figure(hf4);
hold on;
[ri,co] = find(death_cells==1);
plot(co,ri,'o','color',color_dead, 'MarkerSize', size_alive, 'MarkerFaceColor', color_dead);
[ri,co] = find(new_cells==1);
plot(co,ri,'o','color','y', 'MarkerSize', size_alive-10, 'MarkerFaceColor','y');
hold off;


