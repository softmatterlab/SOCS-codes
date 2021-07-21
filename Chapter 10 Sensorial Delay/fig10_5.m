clear all; close all; clc;

figure_pos = [0 0 1000 260];

axes_pos = [[8 10 240 240]; 
            [256 10 240 240];
            [504 10 240 240];
            [762 10 240 240]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



axes(a(1));
x = 0.5*cos(0:0.01:2*pi);
y = 0.5*sin(0:0.01:2*pi);
fill([-1 -1 1 1]*59,[-1 1 1 -1]*59,[1 1 1]*0.8,'EdgeColor',[1 1 1]*0.8)
for i = 1:100
    cc = 1 - (1-[0.9 0.1 0])*(i/100)^1.5;
    fill(x*(100-i),y*(100-i),cc,'EdgeColor',cc)
end
load('1limitnodelay.mat');
n = 6;
plot(X(n,:)*25,Y(n,:)*25,'Color',c(1,:));

load('1limit5tau.mat');
n = 20;
plot(X(n,:)*25,Y(n,:)*25,'Color',c(2,:));

load('1limitneg5tau.mat');
n = 10;
plot(X(n,:)*25,Y(n,:)*25,'Color',c(3,:));
axis('off')


axes(a(2));
load('1limitnodelay.mat');
fill([-1 -1 1 1]*59,[-1 1 1 -1]*59,[1 1 1],'EdgeColor',[1 1 1])
xx = reshape(X,1,1e7)*25;
yy = reshape(Y,1,1e7)*25;
l = -52.5:2:52.5;
for i=2:length(l)-1
    for j=2:length(l)-1
        hh(i,j) = sum ( (xx > l(i-1)) & (xx < l(i)) & (yy > l(j-1)) & (yy < l(j)) );
    end
end
hh = hh/max(max(hh));
for i=2:length(l)-1
    for j=2:length(l)-1
        fill([l(i-1) l(i-1) l(i) l(i)], [l(j-1) l(j) l(j) l(j-1)],1-(1-c(1,:))*hh(i,j)^2,'EdgeColor',1-(1-c(1,:))*hh(i,j)^2)        
    end
end
axis('off') 





axes(a(3));
load('1limit5tau.mat');
fill([-1 -1 1 1]*59,[-1 1 1 -1]*59,[1 1 1],'EdgeColor',[1 1 1])
xx = reshape(X,1,1e7)*25;
yy = reshape(Y,1,1e7)*25;
l = -52.5:2:52.5;
for i=2:length(l)-1
    for j=2:length(l)-1
        hh(i,j) = sum ( (xx > l(i-1)) & (xx < l(i)) & (yy > l(j-1)) & (yy < l(j)) );
    end
end
hh = hh/max(max(hh));
for i=2:length(l)-1
    for j=2:length(l)-1
        fill([l(i-1) l(i-1) l(i) l(i)], [l(j-1) l(j) l(j) l(j-1)],1-(1-c(2,:))*hh(i,j)^2,'EdgeColor',1-(1-c(2,:))*hh(i,j)^2)        
    end
end
axis('off') 





axes(a(4));
load('1limitneg5tau.mat');
fill([-1 -1 1 1]*59,[-1 1 1 -1]*59,[1 1 1],'EdgeColor',[1 1 1])
xx = reshape(X,1,1e7)*25;
yy = reshape(Y,1,1e7)*25;
l = -52.5:2:52.5;
for i=2:length(l)-1
    for j=2:length(l)-1
        hh(i,j) = sum ( (xx > l(i-1)) & (xx < l(i)) & (yy > l(j-1)) & (yy < l(j)) );
    end
end
hh = hh/max(max(hh));
for i=2:length(l)-1
    for j=2:length(l)-1
        fill([l(i-1) l(i-1) l(i) l(i)], [l(j-1) l(j) l(j) l(j-1)],1-(1-c(3,:))*hh(i,j)^2,'EdgeColor',1-(1-c(3,:))*hh(i,j)^2)        
    end
end
axis('off') 