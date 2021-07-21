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
n = 100;
A = zeros(n,n);
p = 0.05;

for i=1:n
    for j=(i+1):n
        A(i,j)=rand<p;
        A(j,i)=A(i,j);
    end
end
phi = (1:n)/n*2*pi;
xy= [sin(phi); cos(phi)]';
gplot(A,xy);
plot(xy(:,1),xy(:,2),'.','Color',c(4,:),'MarkerSize',30);
axis('off')

axes(a(2));
l = 0:25;
h = hist(sum(A),l)/n;
bar(l,h,'FaceColor',c(1,:),'EdgeColor',c(1,:));
P = factorial(n-1)./(factorial(n-1-l).*factorial(l)).*p.^l.*(1-p).^(n-1-l);
plot(l,P,'Color',c(4,:),'LineWidth',5);
labels('$k$','$p(k)$')
xlim([0 15]);


