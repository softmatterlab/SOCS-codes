clear all; close all; clc; 
figure_pos = [0 0 1000 320];

axes_pos = [[8 10 240 240]; 
    [256 10 240 240]
    [504 10 240 240]
    [752 10 240 240]];

[h,a] = initfig(figure_pos,axes_pos);
colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = [];
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

R = 1e-6;
V = 10e-6;
Dr = 0;
N = 100;
x1 = 5*ones(1,N)*1e-6;; 
y1 = 2*ones(1,N)*1e-6;;
phi1 = pi*ones(1,N);
x2 = -5*ones(1,N)*1e-6;; 
y2 = -2*ones(1,N)*1e-6;;
phi2 = zeros(1,N);
dt = .01;
phi=-pi:0.01:pi;
phi = [phi phi(end)];
T = [0 0.2 0.5 1];
for rep = 1:4
    T0 = T(rep); 
    for i = 1:N
        x1(i+1) = x1(i) + V*cos(phi1(i))*dt;
        y1(i+1) = y1(i) + V*sin(phi1(i))*dt;
        x2(i+1) = x2(i) + V*cos(phi2(i))*dt;
        y2(i+1) = y2(i) + V*sin(phi2(i))*dt;
        d = sqrt((x1(i+1)-x2(i+1))^2+(y1(i+1)-y2(i+1))^2);
        theta = atan2(y2(i+1)-y1(i+1),x2(i+1)-x1(i+1));
        phi1(i+1) = phi1(i) - T0*sin(phi1(i)-theta)*cos(phi1(i)-theta)*R^2/d^2;
        phi2(i+1) = phi2(i) - T0*sin(phi2(i)-theta-pi)*cos(phi2(i)-theta-pi)*R^2/d^2;
        if d<2*R
           x1(i+1) = x1(i+1) + (d-2*R)*cos(theta)/2;
           x2(i+1) = x2(i+1) - (d-2*R)*cos(theta)/2;
           y1(i+1) = y1(i+1) + (d-2*R)*sin(theta)/2;
           y2(i+1) = y2(i+1) - (d-2*R)*sin(theta)/2;
        end    
    end
    axes(a(rep));
    fill(x1(i+1)+R*cos(phi),y1(i+1)+R*sin(phi),c(1,:)); hold on
    fill(x2(i+1)+R*cos(phi),y2(i+1)+R*sin(phi),c(1,:));
    plot(x1(1:i+1),y1(1:i+1),'k:','LineWidth',2);
    plot(x2(1:i+1),y2(1:i+1),'k:','LineWidth',2);
    xlim([-7 7]*1e-6)
    ylim([-8 6]*1e-6)
    plot([5 3 3.5 3 3.5]*1e-6,[2 2 1.7 2 2.3]*1e-6,'Color',c(1,:)/2,'LineWidth',3)
    plot(-[5 3 3.5 3 3.5]*1e-6,-[2 2 1.7 2 2.3]*1e-6,'Color',c(1,:)/2,'LineWidth',3)
    axis('off');
end

axes(a(1));
text(-1.8e-6,-4.7e-6,['$T_0 = $ ' num2str(T(1))],'Fontsize',16,'Interpreter','latex')
text(-5.6e-6,-6e-6,['No aligning interaction'],'Fontsize',14,'Interpreter','latex')

axes(a(2))
text(-1.8e-6,-4.7e-6,['$T_0 = $ ' num2str(T(2))],'Fontsize',16,'Interpreter','latex')
text(-6.4e-6,-6e-6,['Weak aligning interaction'],'Fontsize',14,'Interpreter','latex')

axes(a(3))
text(-1.8e-6,-4.7e-6,['$T_0 = $ ' num2str(T(3))],'Fontsize',16,'Interpreter','latex')
text(-6.4e-6,-6e-6,['Medium aligning interaction'],'Fontsize',14,'Interpreter','latex')

axes(a(4))
text(-1.8e-6,-4.7e-6,['$T_0 = $ ' num2str(T(4))],'Fontsize',16,'Interpreter','latex')
text(-5.6e-6,-6e-6,['Strong aligning interaction'],'Fontsize',14,'Interpreter','latex')

