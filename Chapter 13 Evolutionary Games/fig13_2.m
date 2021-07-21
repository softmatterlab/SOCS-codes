clear all; close all; clc; 
figure_pos = [0 100 1000 400];

yshift = 60;

axes_pos = [[0 yshift 500 330];
            [540 yshift 500 330]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



n = 5;
m = 3;
for i=1:7
    axes('Units','Pixels','position',[i*50+70, yshift+140, 40 40]);
    if i>n
        [img, map, alphachannel] = imread('demon.png');
    else
        [img, map, alphachannel] = imread('angel.png');
    end
    image(img, 'AlphaData', alphachannel);
    axis('off');
    
    
    
    axes('Units','Pixels','position',[i*50+70, yshift+60, 40 40]);
    if i>m
        [img, map, alphachannel] = imread('demon.png');
    else
        [img, map, alphachannel] = imread('angel.png');
    end
    image(img, 'AlphaData', alphachannel);
    axis('off');
    
end


axes(a(1));
plot([0 0 1 1]*240+120, [0 1 1 0]*10+185,'k','Linewidth',3)
text(230,215,'{\bf $n$}','Units','Pixels','Fontsize',22,'Interpreter','latex')



plot([0 0 1 1]*145+120, -[0 1 1 0]*10+55,'k','Linewidth',3)
text(180,25,'{\bf $m$}','Units','Pixels','Fontsize',22,'Interpreter','latex')

text(150,280,'{\bf Intended Strategy}','Units','Pixels','Fontsize',20,'Interpreter','latex')
text(5,155,'Player A','Units','Pixels','Fontsize',20,'Interpreter','latex')
text(5,75,'Player B','Units','Pixels','Fontsize',20,'Interpreter','latex')
xlim([0 500]);
ylim([0 330]);
axis off;




for i=1:7
    axes('Units','Pixels','position',[i*50+610, yshift+140, 40 40]);
    if i>m+1
        [img, map, alphachannel] = imread('demon.png');
    else
        [img, map, alphachannel] = imread('angel.png');
    end
    image(img, 'AlphaData', alphachannel);
    axis('off');
    
    
    
    axes('Units','Pixels','position',[i*50+610, yshift+60, 40 40]);
    if i>m
        [img, map, alphachannel] = imread('demon.png');
    else
        [img, map, alphachannel] = imread('angel.png');
    end
    image(img, 'AlphaData', alphachannel);
    axis('off');
    
end

axes(a(2));

ta = 'RRRSPPP';
tb = 'RRRTPPP';
for i=1:7
    text(78+i*50,35,['$' tb(i) '$'],'Fontsize',22,'Interpreter','latex');
    text(78+i*50,205,['$' ta(i) '$'],'Fontsize',22,'Interpreter','latex');
end



plot([0 0]+315,[0 1]*160+40,'k--','LineWidth',2)
text(145,280,'{\bf Implemented Strategy}','Units','Pixels','Fontsize',20,'Interpreter','latex')
text(5,155,'Player A','Units','Pixels','Fontsize',20,'Interpreter','latex')
text(5,75,'Player B','Units','Pixels','Fontsize',20,'Interpreter','latex')
xlim([0 500]);
ylim([0 330]);
axis off;






axes('Units','Pixels','position',[0 0 500 300]);
plot([0 1 0.95 1 0.95]*340+115, [0 0 1 0 -1]*10+50,'k','Linewidth',3)
text(220,20,'Rounds','Units','Pixels','Fontsize',22,'Interpreter','latex')
xlim([0 500]);
ylim([0 300]);
axis('off');


axes('Units','Pixels','position',[540 0 500 300]);
plot([0 1 0.95 1 0.95]*340+115, [0 0 1 0 -1]*10+50,'k','Linewidth',3)
text(220,20,'Rounds','Units','Pixels','Fontsize',22,'Interpreter','latex')
xlim([0 500]);
ylim([0 300]);
axis('off');


