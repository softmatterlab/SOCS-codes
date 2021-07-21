function [ x1, v1 ] = leapfrog_step( dt, x0, v0, m, k  )
%EULER_STEP Euler algorithm for propagation with finite differences
%
%   Input parameters:
%       dt : timestep
%       x0 : initial value of the position
%       v0 : initial value of the position
%       m  : mass of the particle
%       F  : force
%
%   Output parameters:
%       x1 : final position
%       v1 : final position


xh = x0 + v0*0.5*dt;
Fh = -k*xh;
v1 = v0 + Fh./m*dt;
x1 = xh + v1*0.5*dt;

end

