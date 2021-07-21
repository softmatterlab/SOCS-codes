function [x,y,V0,V] = volterra_lotka_implicit_Euler(x0,y0,dt,Niter,alpha,beta,gamma,delta)
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

h = dt;

for i=1:Niter
    
    
    % to find x(i+1)
    a_x = (1-h*alpha)*h*delta;
    b_x = -((1-h*alpha)*(1+h*gamma)+h*(delta*x(i)+beta*y(i)));
    c_x = (1+h*gamma)*x(i);
    
    discr_x = b_x^2-4*a_x*c_x;
    if discr_x<0
        error('iter %d - discr_x=%e <0\n',i,discr_x);
    end
    x_plus = (-b_x+sqrt(discr_x))/(2*a_x);
    x_minus = (-b_x-sqrt(discr_x))/(2*a_x);
    solu = [x_plus,x_minus];
    if min(solu) > 0
        warning('iter %d - min([x_plus,x_minus])=%e >0\n',i,min(solu));
    end
    diff = abs(solu-x(i));
    i0 = find(diff==min(diff));
    newx = solu(i0);
    
    % to find y(i+1)
    a_y = (1+h*gamma)*h*beta;
    b_y = ((1-h*alpha)*(1+h*gamma)-h*(delta*x(i)+beta*y(i)));
    c_y = -(1-h*alpha)*y(i);
    
    discr_y = b_y^2-4*a_y*c_y;
    if discr_y<0
        error('iter %d - discr_y=%e <0\n',i,discr_y);
    end
    y_plus = (-b_y+sqrt(discr_y))/(2*a_y);
    y_minus = (-b_y-sqrt(discr_y))/(2*a_y);
    solu = [y_plus,y_minus];
    if min(solu) > 0
        warning('iter %d - min([y_plus,y_minus])=%e >0\n',i,min(solu));
    end
    diff = abs(solu-y(i));
    i0 = find(diff==min(diff));
    newy = solu(i0);
    
    x(i+1) = x(i)+newx*(alpha-beta*newy)*dt;
    y(i+1) = y(i)+newy*(delta*newx-gamma)*dt;
    
    
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

