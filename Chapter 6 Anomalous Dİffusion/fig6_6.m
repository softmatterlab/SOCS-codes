clear all; close all; clc; 

figure_pos = [0 0 1000 350];

axes_pos = [[60 80 250 250]; 
            [390 80 250 250];
            [745 80 250 250]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

load('figAD_lw.mat');

axes(a(1));
plot((x1-mean(x1))/std(x1),'Color',c(1,:),'LineWidth',2);
plot((x2-mean(x2))/std(x2),'Color',c(3,:),'LineWidth',2);
labels('$t$ [steps]','$x$')
legend('$\alpha = 1$','$\alpha = 2$','FontSize',16,'Interpreter','Latex','box','off','location','southeast')
xlim([0 499]);
ylim([-3.9 3.9]);

axes(a(2));
r1x = r1x-mean(r1x); r1y = r1y-mean(r1y); r2x = r2x-mean(r2x); r2y = r2y-mean(r2y);
plot(r1x/sqrt(mean(r1x.^2+r1y.^2)),r1y/sqrt(mean(r1x.^2+r1y.^2)),'Color',c(1,:),'LineWidth',2);
plot(r2x/sqrt(mean(r2x.^2+r2y.^2)),r2y/sqrt(mean(r2x.^2+r2y.^2)),'Color',c(3,:),'LineWidth',2);
labels('$x$','$y$')
% legend('$\alpha = 0.5$','$\alpha = 1$','FontSize',16,'Interpreter','Latex','box','off','location','northeast')
xlim([-1.9 1.9]);
ylim([-1.9 1.9]);


axes(a(3));
load('lw_erg.mat');
N = 500;
msd = zeros(1,N-1);
for i=1:N-1
    msd(i)=mean((x(:,i+1)-x(:,1)).^2);
end

ind = round(exp(log(1):0.2:log(N)));
plot(ind,msd(ind),'.','Color',c(3,:),'Markersize',20); 

set(gca,'xscale','log','yscale','log')
xlim([0.5 1000]);
ylim([0.005 8e5]);
y = y(1:5000);
msd = zeros(1,N-1);
for i=1:N-1
    msd(i) = mean((y(1+i:end)-y(1:end-i)).^2);
end
plot(ind,msd(ind),'o','Color',c(3,:),'Markersize',5,'LineWidth',2); 
plot(5*[2 100],[4 10000]*1,'k--','LineWidth',2);
labels('$t$ [steps]', 'MSD');
legend('Ensemble average','Time average','FontSize',14,'Interpreter','Latex','box','off','Location','Southeast')
text(40,16,'$\alpha=2$','FontSize',16,'Interpreter','latex','Rotation',38);

