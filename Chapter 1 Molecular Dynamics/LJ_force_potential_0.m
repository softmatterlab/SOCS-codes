function [Fx, Fy, Vgas] = LJ_force_potential_0(x,y,sigma,epsilon,rmin,rmax)
%LJ_force Summary of this function goes here
%   Detailed explanation goes here
% potential
% V = 4*epsilon*((r/sigma).^(-12)-(r/sigma).^(-6));
% force
% F = 24*epsilon/r*((r/sigma).^(-12)-(r/sigma).^(-6));

Fx = 0*x;
Fy = 0*y;
Vp = 0*x;

for i=1:numel(x)
    r = sqrt((x-x(i)).^2+(y-y(i)).^2);
    %r(r<rmin) = rmin;
    phi = atan2(y(i)-y,x(i)-x); % proper sign!
    %phi = atan2(y-y(i),x-x(i)); % proper sign!
    LJtermV = ((sigma./r).^(12)-(sigma./r).^(6));
    LJtermF = (2*(sigma./r).^(12)-(sigma./r).^(6));
    F = 24*epsilon./r.*LJtermF;
    %F(r>rmax) = 0;
    V = 4*epsilon.*LJtermV;
    %V(r>rmax) = 0;
    Fxpart = F.*cos(phi);
    Fypart = F.*sin(phi);
    igood = setdiff(1:numel(x),i);
    Fx(i) = sum(Fxpart(igood));
    Fy(i) = sum(Fypart(igood));
    Vp(i) = sum(V(igood));
end

Vgas = 0.5*sum(Vp);

end

