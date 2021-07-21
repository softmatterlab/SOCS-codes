clear all; close all; clc; 
figure_pos = [0 0 600 500];

axes_pos = [[80 80 510 410]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#F2D314';'#E66C00';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


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


MSD=zeros(4,20);
for i=1:N
    x(:,i+1)=x(:,i)+sqrt(2*D*dt)*ksix(:,i)+V.*cos(phi)*dt;
    y(:,i+1)=y(:,i)+sqrt(2*D*dt)*ksiy(:,i)+V.*sin(phi)*dt;
    phi=phi+sqrt(2*Dr*dt)*ksip(:,i);
    
    if i==N
        
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
        axes(a(1));
        loglog(t,(MSD(1,:)),'o','Color',c(1,:),'MarkerSize',10,'LineWidth',2); hold on;
        loglog(t,((4*D+2*V(1)^2/Dr)*t+2*V(1)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(1,:),'LineWidth',2)
        loglog(t,(MSD(2,:)),'s','Color',c(2,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(2)^2/Dr)*t+2*V(2)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(2,:),'LineWidth',2)
        loglog(t,(MSD(3,:)),'d','Color',c(3,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(3)^2/Dr)*t+2*V(3)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(3,:),'LineWidth',2)
        loglog(t,(MSD(4,:)),'^','Color',c(4,:),'MarkerSize',10,'LineWidth',2);
        loglog(t,((4*D+2*V(4)^2/Dr)*t+2*V(4)^2/Dr^2*( exp(-t*Dr) -1 ))*1e12,'Color',c(4,:),'LineWidth',2)
        xlabel('$t $','FontSize',22,'Interpreter','Latex');
        ylabel('$ \rm MSD(t) \ [\mu m^2]$','FontSize',22,'Interpreter','Latex');
%         xlim([0.005 80]);
%         text(10,400,'\bf (b)','Units','Pixels','Fontsize',25,'Interpreter','Latex')
        
        loglog([0.5 5]/1.8, [5 500]/2,'k--','LineWidth',2)
        ylim([0.002  5e4]);
        xlim([0.003  999]);
        loglog([30 300]/1.8, [1 10]*2000,'k--','LineWidth',2)
        set(gca,'xscale','log','yscale','log');
        text(1,0.5,'$\propto t^2$','FontSize',18,'Interpreter','latex','Rotation',55);
        text(30,3000,'$\propto t$','FontSize',18,'Interpreter','latex','Rotation',30);
    end

    
%     plot(x(2,1:i),y(2,1:i),'Color',[.3 0 .7]); plot(x(3,1:i),y(3,1:i),'Color',[.7 0 .3]); plot(x(4,1:i),y(4,1:i),'Color',[1 0 0]); 
%     H=getframe(h);
%     writeVideo(v,H); 
end

