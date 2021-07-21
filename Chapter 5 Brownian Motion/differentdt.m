clear all; close all; clc; 

figure_pos = [2000 -600 800 750];

axes_pos = [[80 390 230 230]; 
            [320 390 230 230];
            [560 390 230 230];
            [80 80 230 230]; 
            [320 80 230 230];
            [560 80 230 230];];


[h,a] = initfig(figure_pos,axes_pos);
 

titles = ['   \bf{$\Delta t = 0.01$}  '; 
          '   \bf{$\Delta t = 0.05$}  '; 
          '   \bf{$\Delta t = 0.1$}   '];
     
colors = ['#0090B3';'#34B400';'#E66C00'];

ax = 1;
for dt=[0.01,0.05,0.1]
    N = 5/dt;
    x = zeros(N,50);
    r = randn(N,50);
    for i=1:N-1
        x(i+1,:) = x(i,:) + r(i,:)*sqrt(dt); 
    end
    axes(a(ax));
    xlabel('$t$ [s]','FontSize',22,'Interpreter','Latex');
    ylabel('$x(t)$','FontSize',22,'Interpreter','Latex');
    if ax>1
        set(gca,'yTick',[]);
        ylabel('');
    end
    xlim([0 4.99]);
    ylim([-7.9 7.9])
    c = sscanf(colors(ax,2:end),'%2x%2x%2x',[1 3])/255;
    plot((1:N)*dt,x,'Color',[c]);
    title(titles(ax,:),'FontSize',16,'Interpreter','Latex');
    ax = ax + 1;  
end




ax = 1;
for dt=[0.01,0.05,0.1];
    N = 5/dt;
    x = zeros(N,10000);
    r = randn(N,10000);
    for i=1:N-1
        x(i+1,:) = x(i,:) + r(i,:)*sqrt(dt); 
    end
    MSD=mean(x.^2,2);
    c = sscanf(colors(ax,2:end),'%2x%2x%2x',[1 3])/255;
    axes(a(ax+3));
    xlabel('$t$ [s]','FontSize',22,'Interpreter','Latex');
    ylabel('$\langle x(t)^2 \rangle $','FontSize',22,'Interpreter','Latex');
    if ax>1
        set(gca,'yTick',[]);
        ylabel('');
    end
    xlim([0 4.99]);
    ylim([0 5.9]);
    plot((0:N-1)*dt,MSD,'.','MarkerSize',20,'Color',[c 0.2]);
    plot((1:N)*dt,(1:N)*dt,'k--','LineWidth',2);
    ax = ax +1;
end

    
    
    
    
 