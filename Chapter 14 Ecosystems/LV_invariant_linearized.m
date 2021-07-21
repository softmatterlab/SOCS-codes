function [Invariantl,Id_levelsl,xsl,ysl,xd_refl,yd_refl,dr_refl] = LV_invariant_linearized(alpha,beta,gamma,delta,xeq,yeq,dx_list,dy_list)
%LV_INVARIANT_LINEARIZED Summary of this function goes here
%   Detailed explanation goes here


% xeq = gamma/delta;
% yeq = alpha/beta;

[xsl, ysl] = meshgrid(dx_list-xeq,dy_list-yeq);

Invariantl = gamma*beta^2*ysl.^2+alpha*delta^2*xsl.^2;




dr_refl = 0.1*min(xeq,yeq);
r_refl = 0.5*dr_refl:dr_refl:2*max(xeq,yeq);
xd_refl = r_refl; % + xeq-min(xeq,yeq) ;
yd_refl = r_refl; % + yeq-min(xeq,yeq) ;
Id_levelsl = gamma*beta^2*yd_refl.^2+alpha*delta^2*xd_refl.^2;




end

