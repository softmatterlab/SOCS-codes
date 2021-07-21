function [x,y,V0,V] = volterra_lotka(x0,y0,dt,Niter,alpha,beta,gamma,delta)
%VOLTERRA_LOTKA Summary of this function goes here
%   Prey-predator system
%   dx/dt = alpha*x-beta*x*y   %preys
%   dy/dt = delta*x*y-gamma*y   %predators
%
%   alpha*x  exponential growth of population of preys
%   beta*x*y preys eaten by predators
%   delta*x*y growth of predators because of eating preys
%   gamma*y   exponential death of predators

% options_label = {'Interpreter','Latex','fontsize',16};

% bx1 = 60;
% bx2 = 20;
% by1 = 60;
% by2 = 20;
% xwi = 300;
% ywi = 300;
% 
% Xpix = bx1 + xwi + bx2;
% Ypix = by1 + ywi + by2;


V0 = delta*x0-gamma*log(x0)+beta*y0-alpha*log(y0);

x = zeros(Niter+1,1);
y = zeros(Niter+1,1);
V = zeros(Niter+1,1);

x(1) = x0;
y(1) = y0;
V(1) = V0;

% figure('Position',[10 10 Xpix Ypix]);
% axes('Position',[bx1 0 xwi 0]/Xpix+[0 by1 0 ywi]/Ypix);

for i=1:Niter
    % x(i+1) = x(i)+x(i)*(alpha-beta*y(i))*dt;
    % y(i+1) = y(i)+y(i)*(delta*x(i)-gamma)*dt;
    x(i+1) = x(i)*(1+(alpha-beta*y(i))*dt);
    y(i+1) = y(i)*(1+(delta*x(i)-gamma)*dt);
    V(i+1) = delta*x(i+1)-gamma*log(x(i+1))+beta*y(i+1)-alpha*log(y(i+1));
%     cla;
%     hold on;
%     plot(x(1:i+1),'.-','color',[0 0.5 0]);
%     plot(y(1:i+1),'.-','color',[1 0.5 0]);
%     hold off;
%     box on;
%     legend('preys','predators');
%     xlabel('$t$',options_label{:});
%     ylabel('$N(x)$',options_label{:});
%     drawnow;
end







end

