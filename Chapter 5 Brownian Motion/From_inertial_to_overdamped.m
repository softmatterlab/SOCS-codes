clear all; close all; clc; 
load('parameters.mat');
colors = '#0090B3';
c = sscanf(colors(2:end),'%2x%2x%2x',[1 3])/255;
dt = m/gamma/1000;                                 % each time step is 0.001 \tau
N = 10000000;                                      % we run the simulation for 100000 steps 
x = zeros(1,N);                                    % preallocating memmory for x
x2 = zeros(1,N);                                   % preallocating memmory for x2
w = randn(1,N-1);                                  % creating random numbers 

c1 = ( ( 2+dt*(gamma/m) ) / (1+dt*(gamma/m)) );    % coefficients for langevin equation with mass
c2 = -1 / (1 + dt*(gamma/m));                      % coefficients for langevin equation with mass
c3 = sqrt(2*kB*T*gamma)/m/(1+dt*(gamma/m))*dt^1.5; % coefficients for langevin equation with mass
d1 = sqrt(2*kB*T/gamma*dt);                        % coefficient for langevin equation without mass

for i=1:N-2
    x(i+2) = c1*x(i+1) + c2*x(i) + c3*w(i);        % simulation of the langevin equation with mass
    x2(i+2) = x2(i+1) + d1*w(i);                   % simulation of the langevin equation with mass 
end





figure_pos = [2000 -600 950 750];

axes_pos = [[80 80 220 220]; 
            [380 80 220 220];
            [700 80 220 220]];


[h,a] = initfig(figure_pos,axes_pos);












axes(a(1));
plot((1:1000)/1000, x(3:1002)*1e9,'k--','LineWidth',2); 
plot((1:1000)/1000, x2(3:1002)*1e9,'Color',c);
labels('$t/ \tau $','$x$ [nm]');
ylim([-.5, .5]);

axes(a(2));
plot((1:100000)/1000, x2(1:100000)*1e9,'Color',c); 
plot((1:100000)/1000, x(1:100000)*1e9,'k--','LineWidth',2); 
labels('$t/ \tau $','$x$ [nm]');
ylim([-5, 5]);




axes(a(3)); 
i = 1;
for tau=-1:0.1:2
    shift = round( (10^tau) *m/gamma/dt);
    msd(i) = mean((x(1+shift:end)-x(1:end-shift)).^2);
    msd2(i) = mean((x2(1+shift:end)-x2(1:end-shift)).^2);
    i = i+1;
end
    
loglog((10.^(-1:0.1:2)), msd*1e18,'.','Color',c,'MarkerSize',20); hold on
loglog((10.^(-1:0.1:2)), msd2*1e18,'k--','LineWidth',2,'MarkerSize',20); 
% plot((1:100000)/1000, x*1e9,'k--','LineWidth',1); 
labels('$t/ \tau $','$\langle x^2(t) \rangle $ [nm$^2$]');
% ylim([-5, 5]);
legend('Inertial','Non-inertial','box','off','location','southeast')
set(gca,'xscale','log','yscale','log')



