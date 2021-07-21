clear all; close all; clc; 
figure_pos = [0 0 1000 270];

axes_pos = [[0 80 176 176]; 
    [264 80 176 176];
    [450 80 176 176];
    [636 80 176 176];
    [822 80 176 176]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#F2D314';'#E66C00';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


% 
% 
axes(a(1));
n=0.9;
R = 1;
X = (-R:(2*R/4):R)*n;
phi=-pi:0.01:pi;
phi = [phi phi(end)];

for x=1:5
    fill(R*sin(phi)+X(x),R*cos(phi)+X(x),1 - (1-c(1,:))*(x/5)^1.5 ,'EdgeColor','None');
end


plot(X(5)+[0 1.5*R],X(5)+[0 1.5*R],'k','LineWidth',2)
plot(X(5)+[1.3*R 1.5*R 1.4*R],X(5)+[1.4*R 1.5*R 1.3*R],'k','LineWidth',2)
plot(X(5)+[0 1.5*R],X(5)+[0 0],'k--','LineWidth',2)
plot(X(5)+.8*cos(0:0.01:(pi/4)),X(5)+.8*sin(0:0.01:(pi/4)),'k','LineWidth',2)
text(1.8,1.4,'$\phi(t)$','FontSize',25,'Interpreter','latex')
text(1.6,2.5,'$v$','FontSize',25,'Interpreter','latex')

xlim([-2 3]);
ylim([-2 3]);

axis('off');
N=500;
D=2e-13;
Dr=0.5;
x=zeros(4,N); 
y=zeros(4,N);
phi=2*pi*rand(4,1);
V=[0; 1; 2; 3;]*1e-6;
ksix=randn(4,N);
ksiy=randn(4,N);
ksip=randn(4,N);
dt=0.01;
for i=1:N
    x(:,i+1)=x(:,i)+sqrt(2*D*dt)*ksix(:,i)+V.*cos(phi)*dt;
    y(:,i+1)=y(:,i)+sqrt(2*D*dt)*ksiy(:,i)+V.*sin(phi)*dt;
    phi=phi+sqrt(2*Dr*dt)*ksip(:,i);
end

vtext = ['    $v=0$     ';
         '$v=1 \ \mu$m/s';
         '$v=2 \ \mu$m/s';
         '$v=3 \ \mu$m/s';];
for i=1:4
    axes(a(i+1));
    plot(x(i,:)*1e6,y(i,:)*1e6,'Color',c(i,:),'LineWidth',2);
    xlim([-9 9]);
    ylim([-9 9]);
    xlabel('x [$\mu$m]','FontSize',22,'Interpreter','latex')
    set(gca,'yTicklabel',{});
    if i==1
        ylabel('y [$\mu$m]','FontSize',22,'Interpreter','latex');
    end
    if i>1
        text(-4,-8,vtext(i,:),'FontSize',16,'Interpreter','Latex');
    else
        text(-3,-8,vtext(i,:),'FontSize',16,'Interpreter','Latex');
    end
    
end

    
    
