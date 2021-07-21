function [x,t,alpha] = logistic_analytical(x0,dt,Niter,r,K,t0)
%LOGISTIC_ANALYTICAL Summary of this function goes here
%   
%   dx/dt = r*x(1-x/K)  
%



alpha = r/K;

t = t0+(0:1:Niter)*dt;



x = K./(1+(K/x0-1).*exp(-r*(t-t0)));



end

