clear all; close all; clc; 

figure_pos = [0 0 1000 400];

axes_pos = [[60 80 250 250]; 
            [390 80 250 250];
            [745 80 250 250]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('figAD_sbm.mat');

axes(a(1));
plot((x1-mean(x1))/std(x1),'Color',c(2,:),'LineWidth',2);
plot((x2-mean(x2))/std(x2),'Color',c(1,:),'LineWidth',2);
plot((x3-mean(x3))/std(x3),'Color',c(3,:),'LineWidth',2);
labels('$t$ [steps]','$x$')
legend('$\alpha = 0.5$','$\alpha = 1$','$\alpha=2$','FontSize',14,'Interpreter','Latex','box','off','location','northeast')
xlim([0 499]);
ylim([-3.9 4.9]);

axes(a(2));
r1x = r1x-mean(r1x); r1y = r1y-mean(r1y); r2x = r2x-mean(r2x); r2y = r2y-mean(r2y); r3x = r3x-mean(r3x); r3y = r3y-mean(r3y);
plot(r1x/sqrt(mean(r1x.^2+r1y.^2)),r1y/sqrt(mean(r1x.^2+r1y.^2)),'Color',c(2,:),'LineWidth',2);
plot(r2x/sqrt(mean(r2x.^2+r2y.^2)),r2y/sqrt(mean(r2x.^2+r2y.^2)),'Color',c(1,:),'LineWidth',2);
plot(r3x/sqrt(mean(r3x.^2+r3y.^2)),r3y/sqrt(mean(r3x.^2+r3y.^2)),'Color',c(3,:),'LineWidth',2);
labels('$x$','$y$')
% legend('$\alpha = 0.5$','$\alpha = 1$','FontSize',16,'Interpreter','Latex','box','off','location','northeast')
xlim([-2.9 2.9]);
ylim([-2.9 2.9]);


axes(a(3));
load('ctrw_sbm.mat');
N = 500;
msd = zeros(1,N-1);
for i=1:N-1
    msd(i)=mean((x(:,i+1)-x(:,1)).^2);
end

ind = round(exp(log(1):0.2:log(N)));
plot(ind,msd(ind),'.','Color',c(1,:),'Markersize',20); 

set(gca,'xscale','log','yscale','log')
xlim([0.5 1000]);
ylim([0.05 100000]);
y = y(1:5000);
msd = zeros(1,N-1);
for i=1:N-1
    msd(i) = mean((y(1+i:end)-y(1:end-i)).^2);
end
plot(ind,msd(ind),'o','Color',c(1,:),'Markersize',5,'LineWidth',2); 
plot([1 100]*6,4*[1 100].^1.5,'k--','LineWidth',2);
labels('$t$ [steps]', 'MSD');
legend('Ensemble average','Time average','FontSize',14,'Interpreter','Latex','box','off','Location','Southeast')
text(30,15,'$\alpha=1.5$','FontSize',16,'Interpreter','latex','Rotation',37);

