clear all; close all; clc; 
figure_pos = [0 0 900 340];

axes_pos = [[75 80 370 250]; 
            [525 80 370 250]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

r = 0.1;
K = 2;
x0 = 0.1;
dt = 0.05;
Tsim = 100;
Niter = round(Tsim/dt);
[x,t,alpha] = logistic(x0,dt,Niter,r,K);
dt1 = 5;
Niter1 = round(Tsim/dt1);
[x1,t1,alpha] = logistic(x0,dt1,Niter1,r,K);
t0=0;
[x_an,t_an,alpha_an] = logistic_analytical(x0,dt,Niter,r,K,t0);


axes(a(1));
plot(t,x,'-','color',cc(1,:),'LineWidth',2);
plot(t1,x1,'.','color',cc(4,:),'MarkerSize',30);
labels('$t$','$N(t)$');
ylim([0 2.2])

axes(a(2));
plot(t_an,x_an,'-','color',[0 0 0]+0.5,'LineWidth',2);
labels('$t$','$N(t)$');
ylim([0 2.2])