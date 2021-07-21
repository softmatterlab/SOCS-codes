clear all; close all; clc; 

figure_pos = [0 0 800 500];

axes_pos = [[70 80 320 320]; 
            [470 80 320 320]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


axes(a(1));

gamma = 0.57722;
p = 0.005*1.1416.^(1:40);
avP = zeros(1,length(p));
C = zeros(1,length(p));
for ind = 1:length(p)
    n = 500;
    A = zeros(n,n);

    for i=1:n
        for j=(i+1):n
            A(i,j)=rand<p(ind);
            A(j,i)=A(i,j);
        end
    end
    avP(ind) = mean(mean(pathlength(A)));
    C(ind) = trace(A^3)/sum(sum(A).*(sum(A)-1));
    disp(ind);
end
plot(p, 2 - p,'k','Color',c(2,:),'LineWidth',2)
plot(p,(log(n)-gamma)./(log(p*(n-1)))+0.5,'k','Color',c(3,:),'LineWidth',2)
plot(p(1:end-1),avP(1:end-1),'.','color',c(2,:),'Markersize',25)

set(gca,'xscale','log');
xlim([0.005 2.09]);
ylim([0.69 3.9])
labels('$p$','$l$')

axes(a(2));
plot([0 1]*2, [0 1]*2 ,'k--','LineWidth',2)
plot(p,C,'.','color',c(1,:),'Markersize',25)
xlim([0 1.09]);
ylim([0 1.09]);
labels('$p$','$C$')
