% Active Microswimmer 
clear all; close all; clc;
N=500000;
D=2e-13;
Dr=0.5;
x=zeros(4,N)+[40e-6*ones(1,N);-40e-6*ones(1,N);-40e-6*ones(1,N);40e-6*ones(1,N)]; 
y=zeros(4,N)+[40e-6*ones(1,N);40e-6*ones(1,N);-40e-6*ones(1,N);-40e-6*ones(1,N)];
phi=2*pi*rand(4,1);
V=[0; 1; 2; 3;]*1e-6;
ksix=randn(4,N);
ksiy=randn(4,N);
ksip=randn(4,N);
dt=0.01;

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = [];
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end



h=figure; set(h,'Color','w','Units','Pixels','Position',[0 0 1020 540]);
a1=axes('Units','Pixels','Position',[70 70 430 430]); box on;  hold on;

xlabel('$x \ [\mu m]$','FontSize',20,'Interpreter','Latex');
ylabel('$y \ [\mu m]$','FontSize',20,'Interpreter','Latex');
xlim([-149 149]); 
ylim([-149 149]);


a2=axes('Units','Pixels','Position',[580 70 430 430]); box on;  

MSD=zeros(4,20);
for i=1:N
    x(:,i+1)=x(:,i)+sqrt(2*D*dt)*ksix(:,i)+V.*cos(phi)*dt;
    y(:,i+1)=y(:,i)+sqrt(2*D*dt)*ksiy(:,i)+V.*sin(phi)*dt;
    phi=phi+sqrt(2*Dr*dt)*ksip(:,i);
    
    if i==25000
    axes(a1);
    cla; hold on;
    plot(x(1,1:i)*1e6,y(1,1:i)*1e6,'Color',c(1,:),'LineWidth',2); plot(x(2,1:i)*1e6,y(2,1:i)*1e6,'Color',c(2,:),'LineWidth',2); 
    plot(x(3,1:i)*1e6,y(3,1:i)*1e6,'Color',c(3,:),'LineWidth',2); plot(x(4,1:i)*1e6,y(4,1:i)*1e6,'Color',c(4,:),'LineWidth',2);  
    plot(x(1,i)*1e6,y(1,i)*1e6,'.','Color',c(1,:),'MarkerSize',30);  plot(x(2,i)*1e6,y(2,i)*1e6,'.','Color',c(2,:),'MarkerSize',30);   
    plot(x(3,i)*1e6,y(3,i)*1e6,'.','Color',c(3,:),'MarkerSize',30);   plot(x(4,i)*1e6,y(4,i)*1e6,'.','Color',c(4,:),'MarkerSize',30); 
%     title(['\bf{$t=$ ' num2str(round(dt*i*10)/10) ' [s]}'],'FontSize',14,'Interpreter','Latex')
 plot(80.5,-110,'.','Color',c(1,:),'MarkerSize',30); 
text(90.6,-111,'$0 \ \mu m \rm{s}^{- 1}$','FontSize',15,'Interpreter','Latex')
 plot(-130,-110,'.','Color',c(2,:),'MarkerSize',30); 
text(-119,-110,'$1 \ \mu m \rm{s}^{- 1}$','FontSize',15,'Interpreter','Latex')
plot(-130,-130,'.','Color',c(3,:),'MarkerSize',30); 
text(-119,-131,'$2 \ \mu m \rm{s}^{- 1}$','FontSize',15,'Interpreter','Latex')
plot(80.5,-130,'.','Color',c(4,:),'MarkerSize',30); 
text(90.6,-131,'$3 \ \mu m \rm{s}^{- 1}$','FontSize',15,'Interpreter','Latex')
text(10,400,'\bf (a)','Units','Pixels','Fontsize',25,'Interpreter','Latex')
    elseif i==N
        
        i = 1;
        t=0;
        for shift=0:(log10(1000)/20):log10(50000)
            j=round(10^shift);
            dx=(x(:,1:end-j)-x(:,1+j:end)).^2;
            dy=(y(:,1:end-j)-y(:,1+j:end)).^2;
            MSD(:,i)=mean((dx+dy)')*1e12;
            t(i) = dt*j;
            i = i+1;
        end
        axes(a2);
        loglog(t,(MSD(1,:)),'o','Color',c(1,:),'MarkerSize',10,'LineWidth',2); hold on;
        loglog(t,((4*D+2*V(1)^2/Dr)*t+2*V(1)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(1,:),'LineWidth',2)
        loglog(t,(MSD(2,:)),'s','Color',c(2,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(2)^2/Dr)*t+2*V(2)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(2,:),'LineWidth',2)
        loglog(t,(MSD(3,:)),'d','Color',c(3,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(3)^2/Dr)*t+2*V(3)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(3,:),'LineWidth',2)
        loglog(t,(MSD(4,:)),'^','Color',c(4,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(4)^2/Dr)*t+2*V(4)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(4,:),'LineWidth',2)
        xlabel('$t $','FontSize',20,'Interpreter','Latex');
        ylabel('$ \rm MSD \ [\mu m^2]$','FontSize',20,'Interpreter','Latex');
%         xlim([0.005 80]);
        text(10,400,'\bf (b)','Units','Pixels','Fontsize',25,'Interpreter','Latex')
        
        loglog([0.5 5]/1.8, [5 500]/2,'k--','LineWidth',2)
        
        loglog([30 300]/1.8, [1 10]*2000,'k--','LineWidth',2)
        text(1,0.5,'$\propto t^2$','FontSize',18,'Interpreter','latex','Rotation',55);
        text(30,3000,'$\propto t$','FontSize',18,'Interpreter','latex','Rotation',30);
    end

    
%     plot(x(2,1:i),y(2,1:i),'Color',[.3 0 .7]); plot(x(3,1:i),y(3,1:i),'Color',[.7 0 .3]); plot(x(4,1:i),y(4,1:i),'Color',[1 0 0]); 
%     H=getframe(h);
%     writeVideo(v,H); 
end
% close(v);