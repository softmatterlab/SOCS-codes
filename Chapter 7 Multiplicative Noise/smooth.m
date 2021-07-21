function [ysm] = smooth(y)
%SMOOTH Summary of this function goes here
%   Detailed explanation goes here

ysm = 0*y;

for i=3:numel(y)-2
    ysm(i) = mean(y(i+(-2:1:2)));
end

ysm(2) = mean(y(1:3));
ysm(end-1) = mean(y(end-1+(-1:1:1)));

ysm(1) = y(1);
ysm(end) = y(end);

end

