function [Invariant,Id_levels,xs,ys,xeq,yeq,dr,x_list,y_list] = LV_invariant_0(alpha,beta,gamma,delta)
%LV_INVARIANT Summary of this function goes here
%   Detailed explanation goes here

xeq = gamma/delta;
yeq = alpha/beta;

dr = 0.01*min(xeq,yeq);
r0 = 2*max(xeq,yeq);

x_list = dr:dr:r0;
y_list = dr:dr:r0;
[xs, ys] = meshgrid(x_list,y_list);
Invariant = delta*(xs)-gamma*log(xs)+beta*(ys)-alpha*log(ys);


dr_ref = 0.1*min(xeq,yeq);
r_ref = 0.5*dr_ref:dr_ref:min(xeq,yeq);
xd_ref = r_ref + xeq-min(xeq,yeq) ;
yd_ref = r_ref + yeq-min(xeq,yeq) ;
Id_levels = delta*(xd_ref)-gamma*log(xd_ref)+beta*(yd_ref)-alpha*log(yd_ref);


end

