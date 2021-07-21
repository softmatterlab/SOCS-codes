clear all; close all; clc; 

figure_pos = [0 200 800 430];

axes_pos = [[5 70 350 350]; 
            [445 70 350 350]];


[h,a] = initfig(figure_pos,axes_pos);



c = zeros(8,3);
colors = ['#5429FF';'#29A6FF';'#29F7FF'; '#29FFB0';'#7BFF29';'#D9FF29';'#FFD429';'#FF2929'];
for i=1:8
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));
L = 30;
R = 0.78;
s = 1.5;
N=7;
mu = 0.01;
tt=200;
S = ceil(rand(L,L)*(N+1))-1;
pop = zeros(N+1,tt);

for t = 1:tt
    S = mditer(S,R,s,N,L,mu);
   
    for i=1:N+1
        pop(i,t)=sum(sum(S==i-1))/L^2;
    end
end

imagesc(S);

colormap(flipud(c));
xlim([0.5 L+0.5]);
ylim([0.5 L+0.5]);
fill([2 10 10 2 2]*0.3+0.7,30.5-[1 1 10 10 1]*0.4,[0.8 0.8 0.8],'LineStyle','none','facealpha',.8)
axis off;


axes('Units','Pixels','Position',[15 0 300 300]); hold on;
tt = '01234567';
for i=1:8
    fill([0 0 1 1 0]*0.5+0.5*i-1.9,[0 1 1 0 0]*0.5-1.8,c(8-i+1,:),'EdgeColor','None')
    plot([0 0]-1.65+i*0.5,[0 0.1]-1.8,'k','Linewidth',1);
    text(-1.73+i*0.5,-2.0,tt(i),'FontSize',16,'Interpreter','latex');
end
plot(-1.4+4*[0 0 1 1 0],-1.8+0.5*[0 1 1 0 0],'k','Linewidth',1.5);
xlim([-1.6,2.6]);
ylim([-1.8,2.4]-0.32);
axis('off')



axes(a(2));
for i=1:N+1
    plot(pop(i,:),'color',c(9-i,:),'LineWidth',2);
end
labels('Time','Population fraction')
xlim([0 199]);