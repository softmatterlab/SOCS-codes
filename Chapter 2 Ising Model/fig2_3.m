clear all; close all; clc; 

h = figure('Color','w','Units','Pixels','Position',[0 0 1000 780]);

colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('isingfigure.mat');
t = [0 100 10000 100000];

for i=1:12
    axes('Units','Pixels','Position',[70+230*mod(i-1,4) 20+(2-floor(i/4.5))*240 220 220])
    set(gca,'fontname','times','FontSize',14)  % Set it to times
    imagesc(reshape(A(i,:,:),200,200));
    C = [c(1,:); c(4,:)];
    colormap(C);
    set(gca,'xTick',[],'yTick',[]);
    if i<5
        title(['$t=$ '  num2str(t(i))],'Interpreter','Latex','FontSize',22)
    end
    if i==1
        ylabel('$T<T_c$','Interpreter','Latex','FontSize',22)
    elseif i==5
        ylabel('$T=T_c$','Interpreter','Latex','FontSize',22)
    elseif i==9
        ylabel('$T>T_c$','Interpreter','Latex','FontSize',22)
    end
end

    




