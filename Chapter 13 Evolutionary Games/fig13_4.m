clear all; close all; clc; 

figure_pos = [0 200 1000 370];

axes_pos = [[10 10 290 290]; 
            [360 10 290 290];
            [700 10 290 290]];


[h,a] = initfig(figure_pos,axes_pos);


% colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
% c = zeros(4,3);
% for i=1:4
%     c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
% end
c = zeros(8,3);
colors = ['#5429FF';'#29A6FF';'#29F7FF'; '#29FFB0';'#7BFF29';'#D9FF29';'#FFD429';'#FF2929'];
for i=1:8
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));
x = [0 -1 0 0 1];
y = [0 0 -1 1 0];

N=7;
% C = zeros(N,3);
% for t=1:N+1
%     C(t,:)=[0 0 1]*(1-((t-1)/N))+[1 1 0]*(t-1)/N;
% end
points =[27 24.5 28 22.5 26];

for i=1:length(x)
        col = randi(N);
        if i==2
            col = 1;
        elseif i==4
            col = 8;
        end
        fill([0 0 1 1 0]+x(i),[0 1 1 0 0]+y(i),c(col,:),'EdgeColor','None')
        text(x(i)+0.5,y(i)+0.5,num2str(points(i)),'FontSize',20,'Interpreter','latex','HorizontalAlignment', 'center')
        axes(a(2));
        fill([0 0 1 1 0]+x(i),[0 1 1 0 0]+y(i),c(col,:),'EdgeColor','None')    
        axes(a(1));
end

for i= 1:4
    plot([1 1]*(i-2),[-1 2],'k','LineWidth',2);
    plot([-1 2],[1 1]*(i-2),'k','LineWidth',2);   
end


tt = '01234567';
for i=1:8
    fill([0 0 1 1 0]*0.5+0.5*i-1.9,[0 1 1 0 0]*0.5-1.8,c(8-i+1,:),'EdgeColor','None')
    plot([0 0]-1.65+i*0.5,[0 0.1]-1.8,'k','Linewidth',1);
    text(-1.73+i*0.5,-2.0,tt(i),'FontSize',16,'Interpreter','latex');
end
plot(-1.4+4*[0 0 1 1 0],-1.8+0.5*[0 1 1 0 0],'k','Linewidth',1.5);




title('Competition','FontSize',18,'Interpreter','latex');




xlim([-1.6,2.6]);
ylim([-1.8,2.4]-0.4);
axis('off')




axes(a(2));
i = 1;
fill([0 0 1 1 0]+x(i),[0 1 1 0 0]+y(i),c(8,:),'EdgeColor','None') 
for i= 1:4
    plot([1 1]*(i-2),[-1 2],'k','LineWidth',2);
    plot([-1 2],[1 1]*(i-2),'k','LineWidth',2);   
end

text()
title('Revision','FontSize',18,'Interpreter','latex');
xlim([-1.6,2.6]);
ylim([-1.8,2.4]-0.4);
axis('off');


axes(a(3));
i = 2;
fill([0 0 1 1 0]+x(i)-0.5,[0 1 1 0 0]+y(i),c(8,:),'EdgeColor','None') 
i = 5;
fill([0 0 1 1 0]+x(i)+0.5,[0 1 1 0 0]+y(i),c(randi(8),:),'EdgeColor','None') 

plot([0 1.6 1.2 1.6 1.2]-0.3,[0 0 -0.2 0 0.2]+0.5,'k','LineWidth',3);
title('Mutation','FontSize',18,'Interpreter','latex');
text(-0.5,1.72,'Probability$=\mu$','FontSize',18,'Interpreter','latex')
xlim([-1.6,2.6]);
ylim([-1.8,2.4]-0.4);
axis('off')