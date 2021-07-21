function [ MSD_dep, time_dep ] = MSDf( r, dt, varargin )
%MSDF calculates the mean square displacement of a trajectory in 1,2 or 3 dimensions 
%   
%   Input parameters 
%       r:  trajectory (size(r,2) should be equal to 1, 2 or 3)
%       dt: timestep
%   Output parameters 
%       MSD_dep:  mean square displacement 
%       time_dep: temporal tependence (to use in:  plot(MSD_dep,time_dep) )
%


% number of acquired data points
N = size(r,1);
if (N<50)
    warning('N < 50: trajectory too short\n');
end

ncomp = size(r,2);
if (ncomp>3)
    warning('Dimensions of the data points > 3\n');
end

L = sqrt(N);

for n = 1:2:length(varargin)
    if strcmpi(varargin{n},'L')
        L = varargin{n+1};
%         if (L>sqrt(N))
%             L = sqrt(N);
%         end
    end
end

tpoints = 1:L;

time_dep = (tpoints)*dt;

MSD_dep = zeros(size(time_dep));

for n = tpoints(1):1:tpoints(end)   
    dr = r((1+n):N,:)-r(1:(N-n),:);
    MSD_dep(n) = sum(sum(dr.^2,2))/(N-n+1);        
end

MSD_dep = [0 MSD_dep];
time_dep = [0 time_dep];

end

