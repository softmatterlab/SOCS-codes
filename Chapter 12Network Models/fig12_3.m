clear all; close all; clc; 

figure_pos = [0 0 850 450];

axes_pos = [[10 80 360 360]; 
            [480 80 360 360]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


axes(a(1));
n = 12;
A = zeros(n,n);
p = 0.05;
k = 4; 
beta = 0.2;
phi = (1:n)/n*2*pi;
xy= [sin(phi); cos(phi)]';

for i=1:n
    for j=i+1:i+k/2
        ind = mod(j-1,n)+1;
        A(i,ind)=1;
        A(ind,i)=1;
    end
end
gplot(A,xy);
plot(xy(:,1),xy(:,2),'.','Color',c(4,:),'MarkerSize',30);
axis('off')

rewire = (A==1).*(rand(n,n)<beta);
for i=1:n
    for j=i+1:i+k/2
        ind = mod(j-1,n)+1;
        if rewire(i,ind)==1
            s = sum(sum(A));
            rwind = randsample( find(not(A(i,:))&(1:n~=i)), 1);
            A(i,rwind) = 1;
            A(rwind,i) = 1;
            A(i,ind) = 0;
            A(ind,i) = 0;
        end
    end
end
               
axes(a(2));
gplot(A,xy);
plot(xy(:,1),xy(:,2),'.','Color',c(4,:),'MarkerSize',30);
axis('off')
        