clear all; close all; clc; 

figure_pos = [0 0 850 410];

axes_pos = [[5 5 400 400]; 
            [445 5 400 400]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('data_figure_2.mat','x','y','L','i0','xreplicas','yreplicas','Rflocking');
thetaang = (0:1:360)*pi/180;



axes(a(1));


fill(x(i0)+Rflocking*cos(thetaang),y(i0)+Rflocking*sin(thetaang),c(2,:)+(1-c(2,:))*0.7,'Edgecolor','none');
plot(x,y,'.','color',c(1,:)/1.5,'MarkerSize',12);
plot(xreplicas,yreplicas,'.','color',c(1,:)+(1-c(1,:))*0.7,'MarkerSize',12);
plot(x(i0),y(i0),'.','color',c(2,:)/1.5,'MarkerSize',20,'MarkerFaceColor','r');
% lines to highlight the periodicity
plot(3*[-1 1]*L/2,-L/2+[0 0],'k--');
plot(3*[-1 1]*L/2,L/2+[0 0],'k--');
plot(-L/2+[0 0],3*[-1 1]*L/2,'k--');
plot( L/2+[0 0],3*[-1 1]*L/2,'k--');
xlim(3*[-1 1]*L/2);
ylim(3*[-1 1]*L/2);
set(gca,'Xtick',[],'Ytick',[]);
axis('off');


axes(a(2));

for i=(-1:1)
    for j=(-1:1)
        fill(x(i0)+i*L+Rflocking*cos(thetaang),y(i0)+j*L+Rflocking*sin(thetaang),c(2,:)+(1-c(2,:))*0.7,'Edgecolor','none');
    end
end
plot(x,y,'.','color',c(1,:)/1.5,'MarkerSize',20);
plot(x(i0),y(i0),'.','color',c(2,:)/1.5,'MarkerSize',30,'MarkerFaceColor','r');
xlim([-1 1]*L/2);
ylim([-1 1]*L/2);
set(gca,'Xtick',[],'Ytick',[]);
axis('off');