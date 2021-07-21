clear all; close all; clc; 
load('parameters.mat');
colors = ['#0090B3';'#34B400';'#E66C00'];

kx = 1e-6;
ky = 2.5e-7;

dt = 1e-3;                                 % each time step is 0.001 \tau
N = 1000000;                                        % we run the simulation for 100000 steps 
x = zeros(1,N);                                    % preallocating memmory for x
y = zeros(1,N);                                   % preallocating memmory for x2
w = randn(2,N-1);                                  % creating random numbers 

d  = sqrt(2*kB*T/gamma*dt);                        % coefficient for langevin equation without mass
cx = -kx/gamma*dt;
cy = -ky/gamma*dt;


for i=1:N-1
    x(i+1)= x(i) + cx*x(i) + d*w(1,i);
    y(i+1)= y(i) + cy*y(i) + d*w(2,i);
end

figure_pos = [2000 -600 1000 750];

axes_pos = [[80 80 180 250]; 
            [315 80 180 250];
            [550 80 180 250]
            [810 80 180 250]];


[h,a] = initfig(figure_pos,axes_pos);

axes(a(1));
plot(x*1e9,y*1e9,'.','MarkerSize',0.1); axis('equal'),
labels('$x$ [nm]','$y$ [nm]');   
xlim([-599 599]*18/25);
ylim([-599 599]);

l = -450:10:450;
hx = hist(x*1e9,l); hx = hx/sum(hx);
hy = hist(y*1e9,l); hy = hy/sum(hy);

axes(a(2));
c = sscanf(colors(1,2:end),'%2x%2x%2x',[1 3])/255;
plot(l,hx,'Color',c,'LineWidth',3);
plot(l,max(hx)*exp(-0.5*kx*(l*1e-9).^2/kB/T),'k--','LineWidth',2)
c = sscanf(colors(2,2:end),'%2x%2x%2x',[1 3])/255;
plot(l,hy,'Color',c,'LineWidth',3);
plot(l,max(hy)*exp(-0.5*ky*(l*1e-9).^2/kB/T),'k--','LineWidth',2)
set(gca,'yTick',[]);
labels('$x,y$ [nm]','$p(x), \ p(y)$')
xlim([-399 399]);
ylim([0 max(hx)*1.2])
    


axes(a(3));
crange = 300;
Cx = zeros(1,crange);
Cy = zeros(1,crange);
for i = 0:crange-1
    Cx(i+1) = mean(x(1:end-i).*x(i+1:end));
    Cy(i+1) = mean(y(1:end-i).*y(i+1:end));
end
c = sscanf(colors(1,2:end),'%2x%2x%2x',[1 3])/255;
plot((0:crange-1)*dt,Cx,'Color',c,'LineWidth',3);
c = sscanf(colors(2,2:end),'%2x%2x%2x',[1 3])/255;
plot((0:crange-1)*dt,Cy,'Color',c,'LineWidth',3);
plot((0:crange-1)*dt,max(Cx)*exp(-kx*(0:crange-1)*dt/gamma),'k--','LineWidth',2)
plot((0:crange-1)*dt,max(Cy)*exp(-ky*(0:crange-1)*dt/gamma),'k--','LineWidth',2)
legend({'$x$','$y$','Theory'},'Interpreter','Latex','box','off','location','northeast','FontSize',16)
ylim([0 1.9e-14]);
set(gca,'yTick',[]);
labels('Time [s]','$C_x, \ C_y$');



axes(a(4));
sigma2 = zeros(1,5);
for k=[0.2 1 2 5 10]*1e-6
    x = zeros(1,N);                                    
    w = randn(1,N-1); 
    c = -k/gamma*dt;
    for i=1:N-1
    x(i+1)= x(i) + c*x(i) + d*w(i);
    end
    sigma2([0.2 1 2 5 10]*1e-6==k)=mean(x.^2);
end
plot([0.2 1 2 5 10],sigma2*1e14,'k.','MarkerSize',30);
plot(0.2:0.2:11,kB*T./(0.2:0.2:11)/1e-6*1e14,'k--','LineWidth',2)
labels('$k$ [fN/$\mu$m]','$\langle  x^2 \rangle$ [$\mu$m$^2$]')
xlim([0 10.9])
    
    
    





