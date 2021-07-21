function [ nn_list] = build_nn_list( x, y, dref_nn )
%BUILD_NN_LIST Summary of this function goes here
%   Detailed explanation goes here

N=numel(x);

nn_list = cell(N,1); % initialized to []

for n=1:N
    dist = sqrt((x-x(n)).^2+(y-y(n)).^2);
    
    for i=(n+1):N
        if dist(i)<dref_nn
            nn_list{n} = [nn_list{n} i];
            nn_list{i} = [nn_list{i} n];
        end
    end
end

for n=1:N
    nn_list{n} = sort(nn_list{n},'ascend');
end

end

