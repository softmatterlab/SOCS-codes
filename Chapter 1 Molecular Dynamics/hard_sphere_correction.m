function [ xn, yn, superpositions ] = hard_sphere_correction( x, y, dmin, epsilon, nn_list, crosscheck )
%HARD_SPHERE_CORRECTION Summary of this function goes here
%   Detailed explanation goes here

% dmin is the minimum distance possible among the centers
% epsilon in the additional distance (to add to dmin) to which they are put
N = numel(x);


superpositions = 0;
% crosscheck is initially set to zeros(N,N);

for n=1:N
%     fprintf('%d - %d NN\n',n,numel(nn_list{n}));
%     nn_list{n}
%     pause;
    dist = sqrt((x(nn_list{n})-x(n)).^2+(y(nn_list{n})-y(n)).^2);
    checkdist = dist<dmin;
    superpositions = superpositions + sum(checkdist);
    for i=1:numel(dist)
        if checkdist(i)==1
            j = nn_list{n}(i); % particle index
            if ~(crosscheck(n,j))
                % take the centers and displace the second a bit along the lines
                u21 = [x(j)-x(n); y(j)-y(n)]/sqrt((x(j)-x(n))^2+(y(j)-y(n))^2);
                u12 = -u21;
%                 x(j) = x(n) + u21(1)*(dmin+epsilon);
%                 y(j) = y(n) + u21(2)*(dmin+epsilon); 
                
                x(j) = x(j) + 0.5*u21(1)*(dmin+epsilon-dist(i));
                y(j) = y(j) + 0.5*u21(2)*(dmin+epsilon-dist(i)); 
                x(n) = x(n) + 0.5*u12(1)*(dmin+epsilon-dist(i));
                y(n) = y(n) + 0.5*u12(2)*(dmin+epsilon-dist(i)); 
                
                crosscheck(n,j)=1;
                crosscheck(j,n)=1;
            end
        end
    end
end

xn = x;
yn = y;

end

