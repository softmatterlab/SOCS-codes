clear all; close all; clc; 

figure_pos = [2000 -600 800 980];

axes_pos = [[80 700 230 230]; 
            [320 700 230 230];
            [560 700 230 230];
            [80 390 230 230]; 
            [320 390 230 230];
            [560 390 230 230];
            [80 80 230 230]; 
            [320 80 230 230];
            [560 80 230 230];];


[h,a] = initfig(figure_pos,axes_pos);



load('Data_fig_randomwalks.mat');


r1 = double(r1);
r = [reshape(r1,[10000000,1]),reshape(r2,[10000000,1]),reshape(r3,[10000000,1])];
titles = ['   \bf{Flip Coin }   '; 
          ' \bf{Gaussian steps} '; 
          '\bf{Asymmetric steps}'];
 
      
      
      
colors = ['#0090B3';'#34B400';'#E66C00'];

l = (1:40)/4 - 5;
for i=1:3
    axes(a(i));
    c = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
    dist = hist(double(r(:,i)),l);
    bar(l,dist,'FaceColor',c,'EdgeColor','none');
    xlim([-4.8,4.8]);
    ylim([0 max(hist(double(r(:,i)),l))*1.2])
    set(gca,'yTick',[]);
    xlabel('$\Delta x$','FontSize',22,'Interpreter','Latex');
    ylabel('$p(\Delta x)$ [a.u]','FontSize',22,'Interpreter','Latex');
    if i>1
        set(gca,'yTick',[]);
        ylabel('');
    end
    title(titles(i,:),'FontSize',16,'Interpreter','Latex');
end


for i=1:3
    axes(a(i+3));
    c = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
    x = cumsum(reshape(r(1:100000,i),[1000,100]),1);
    plot(x,1:1000,'Color',[c 0.2]);
    xlim([-139, 139]);
    ylim([0 999])
    xlabel('$x (t)$','FontSize',22,'Interpreter','Latex');
    ylabel('t [steps]','FontSize',22,'Interpreter','Latex');
    if i>1
        set(gca,'yTick',[]);
        ylabel('');
    end
end

l = (-15:15)*10;
for i=1:3
    axes(a(i+6));
    c = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
    x = cumsum(reshape(r(:,i),[1000,10000]),1);
    x = x(end,:);
    dist = hist(x,l);
    bar(l,dist,'FaceColor',c,'EdgeColor','none');
    xlim([-139, 139]);
    ylim([0 1399]);
    xlabel('$x_{1000}$','FontSize',22,'Interpreter','Latex');
    ylabel('$p(x_{1000})$','FontSize',22,'Interpreter','Latex');
    if i>1
        set(gca,'yTick',[]);
        ylabel('');
    end
end