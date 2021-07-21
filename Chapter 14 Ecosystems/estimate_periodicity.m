function [T,dphi,t_jump] = estimate_periodicity(phi,t)
%ESTIMATE_PERIODICITY Summary of this function goes here
%   Detailed explanation goes here

dphi = phi(2:end)-phi(1:end-1);
phi_max = max(phi);
phi_min = min(phi);

jump_ref = (phi_max-phi_min)/2;

dphi_abs = abs(dphi);

ijump = find(dphi_abs>=jump_ref);
t_jump = t(ijump);

if numel(ijump)>1
    for i=1:(numel(t_jump)-1)
        T_est(i) = t_jump(i+1)-t_jump(i);
    end
    T = mean(T_est);
else
    T = NaN;
end

end

