clear all; close all; clc; 

figure_pos = [0 0 850 500];

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
n0 = 5;
m = 3;
A = zeros(n,n);
for i=1:n0
    for j = 1:n0
        if i~=j 
            A(i,j) = 1;
        end
    end
end


for i=1:(n-n0)
    D = sum(A)/sum(sum(A));
    edges = randsample(1:length(A), m, true,D);
    while length(unique(edges))<3
        edges = randsample(1:length(A), m, true,D);
    end
    for j=1:m
        A(i+n0,edges(j))=1;
        A(edges(j),i+n0)=1;
    end
end

phi = (1:n)/n*2*pi;
xy= [sin(phi); cos(phi)]';
gplot(A,xy);
plot(xy(:,1),xy(:,2),'.','Color',c(4,:),'MarkerSize',30);
axis('off')
    

axes(a(2));
hold off;
n = 1000;
n0 = 5;
m = 3;
A = zeros(n,n);
for i=1:n0
    for j = 1:n0
        if i~=j 
            A(i,j) = 1;
        end
    end
end


for i=1:(n-n0)
    D = sum(A)/sum(sum(A));
    edges = randsample(1:length(A), m, true,D);
    while length(unique(edges))<3
        edges = randsample(1:length(A), m, true,D);
    end
    for j=1:m
        A(i+n0,edges(j))=1;
        A(edges(j),i+n0)=1;
    end
end

loglog(sort(sum(A),'descend'),(1:n)/n,'.','Color',c(1,:),'MarkerSize',20);
hold on;
loglog(3:max(sum(A)),m^2*(3:max(sum(A))).^(-2),'k--','LineWidth',2);
xlim([1.5 209]);
ylim([0.0004 5]);
text(15,360-25,'\bf b','Units','Pixels','Fontsize',25,'Interpreter','Latex')
labels('$k$','$C(k)$')
    