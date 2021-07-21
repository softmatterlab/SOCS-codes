clear all; close all; clc; 

h = figure('Color','w','Units','Pixels','Position',[0 0 600 400]);

colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes('Units','Pixels','Position',[80 80 500 300]);
load('data/isingsubcritical.mat');
plot([1 1]*2.269,[0 1],'k--','LineWidth',2)
hold on 
for j=1:32
    for i=1:10
        A(i,j) = mean(abs(mm(i+(j-1)*10,500000:end)));
    end
end
plot(1:0.05:2.05,mean(A(:,11:end)),'.','Color',c(1,:),'MarkerSize',20);


load('data/isingnearcritical.mat');
for j=1:16
    for i=1:10
        A(i,j) = mean(abs(mm(i+(j-1)*10,200000:end)));
    end
end
plot(2.1:0.025:2.475,mean(A(:,1:16)),'.','Color',c(1,:),'MarkerSize',20);



load('data/isingsupercritical.mat');
for j=1:50
    for i=1:10
        A(i,j) = mean(abs(mm(i+(j-1)*10,10000:end)));
    end
end
plot(2.5:0.05:4.95,mean(A),'.','Color',c(1,:),'MarkerSize',20);
labels('$T$','$m$');
xlim([0 4.99]);