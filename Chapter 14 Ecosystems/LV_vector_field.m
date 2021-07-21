function [xs,ys,vx,vy,xeq,yeq,dr,x_list,y_list] = LV_vector_field(alpha,beta,gamma,delta)
%LV_PHASE_SPACE_VECTORS Summary of this function goes here
%   Draws Vector field

xeq = gamma/delta;
yeq = alpha/beta;

%dr = 0.01*min(xeq,yeq);
dr = 0.2*min(xeq,yeq);
r0 = 2.2*max(xeq,yeq);

%x_list = dr:dr:r0;
%y_list = dr:dr:r0;
x_list = (0.5*dr):dr:r0;
y_list = (0.5*dr):dr:r0;

[xs, ys] = meshgrid(x_list,y_list);

vx = alpha*xs.*(1-beta/alpha*ys);
vy = gamma*ys.*(delta/gamma*xs-1);



end

