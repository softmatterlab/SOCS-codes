clear all; close all; clc; 
figure_pos = [0 0 1000 1020];

axes_pos = [[80 660 280 280]; 
            [380 660 280 280];
            [680 660 280 280];
            [80 330 280 280]; 
            [380 330 280 280];
            [680 330 280 280];
            [80 10 280 280]; 
            [380 10 280 280];
            [680 10 280 280]];

[h,a] = initfig(figure_pos,axes_pos);

delay = [0 10 -10];
T = [0 10 100];
t = 'abc';
for i = 1:3
    for j = 1:3
    axes(a(3*(i-1)+j));
    I = imread(['robots/saved_' int2str(delay(i)) '_' t(j) '.png']);
    x = 200;
    if i==2
        x = 285;
    elseif i==3
        x = 260;
    end
    if j==1
        ylabel(['$\delta=' int2str(delay(i)) '$ s'],'FontSize',22,'Interpreter','Latex')
    end
    if i==1
        title(['$t=' int2str(T(j)) '$ s'],'FontSize',22,'Interpreter','Latex')
    end
    y = 200;
    image(I(y:y+690,x:x+690,:));
    xlim([0.5 690.5]);
    ylim([0.5 690.5]);
    fill([0 1 1 0 0]*60+25,595+[0 0 1 1 0]*80,[0.8 0.8 0.8],'LineStyle','none','facealpha',.9)
    set(gca,'xtick',[],'yTick',[]);
    end
end