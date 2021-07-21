function [ x1, v1 ] = Euler_step( dt, x0, v0, m, F  )
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


x1 = x0 + v0*dt;
v1 = v0 + F./m*dt;


end

