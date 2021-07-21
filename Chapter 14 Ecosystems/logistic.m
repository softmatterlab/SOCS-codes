function [x,t,alpha] = logistic(x0,dt,Niter,r,K)
%LOGISTIC Summary of this function goes here
%   
%   dx/dt = r*x(1-x/K)  
%



alpha = r/K;

t = (0:1:Niter)*dt;

x = zeros(Niter+1,1);

x(1) = x0;


for i=1:Niter
    x(i+1) = x(i) + r*x(i)*(1-x(i)/K)*dt;
end







end

