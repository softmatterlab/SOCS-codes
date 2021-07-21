clear all; close all; clc; 

figure_pos = [0 0 1000 700];

axes_pos = [[80 410 240 240]; 
            [415 410 240 240];
            [750 410 240 240];
            [80 80 240 240]; 
            [415 80 240 240];
            [750 80 240 240]];
        
[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

N = 10000;                                       % we run the simulation for 10000 steps 
n = 1000;                                          % repeat
m = 1.11e-14;
gamma = 6*pi*0.001*1e-6;
kB = 1.38e-23; T = 300;
wx = randn(n,1.5*N-1);                                  % creating random numbers 
wy = randn(n,1.5*N-1);                                  % creating random numbers 
wz = randn(1,1.5*N*n-1);

x = zeros(n,1.5*N);                                    % preallocating memmory for x
y = zeros(n,1.5*N);                                    % preallocating memmory for x
z = zeros(1,100*N);
dt = m/gamma/1000;                                 % each time step is 0.001 \tau
dt = 1e-9;

c1 = ( ( 2+dt*(gamma/m) ) / (1+dt*(gamma/m)) );    % coefficients for langevin equation with mass
c2 = -1 / (1 + dt*(gamma/m));                      % coefficients for langevin equation with mass
c3 = sqrt(2*kB*T*gamma)/m/(1+dt*(gamma/m))*dt^1.5; % coefficients for langevin equation with mass
for i=1:(1.5*N)-2
    x(:,i+2) = c1*x(:,i+1) + c2*x(:,i) + c3*wx(:,i);        % simulation of the langevin equation with mass
    y(:,i+2) = c1*y(:,i+1) + c2*y(:,i) + c3*wy(:,i);        % simulation of the langevin equation with mass
%     x2(:,i+2) = x2(:,i+1) + d1*w(:,i);                   % simulation of the langevin equation with mass 
%     x3(:,i+2) = x3(:,i+1) + c*x3(:,i+1) + d1*w(:,i);                   % simulation of the langevin equation with mass 
end

for i=1:(100*N-2)
    z(i+2) = c1*z(i+1) + c2*z(i) + c3*wz(i);        % simulation of the langevin equation with mass
end
    
x = x(:,3:end);
y = y(:,3:end);
x = x - mean(x,2);
y = y - mean(y,2);



                              



axes(a(2));
plot(x(2,:)*1e9,y(2,:)*1e9,'color',c(1,:),'LineWidth',2)
xlim([-2.9 2.9]);
ylim([-2.9 2.9]);
% set(gca,'xTick',[],'yTick',[])
labels('$x$ [nm]','$y$ [nm]');

axes(a(5));
msd = zeros(1,N);
for i=2:N-2
    msd(i)=mean((x(:,N/2+i)-x(:,N/2)).^2+(y(:,N/2+i)-y(:,N/2)).^2);
end
msd = msd*1e18;
dt = dt*1e6;
ind = round(exp(log(2):0.4:log(N)));
plot((ind-1)*dt,msd(ind),'.','Color',c(1,:),'Markersize',20); hold on;
plot(dt*[1 10000],msd(2)*[1 10000],'k--','LineWidth',2)

% msd = zeros(1,N-1);
% for i=1:N-1
%     msd(i) = mean((z(2+i:end)-z(2:end-i)).^2)*2;
%     disp(i);
% end
% msd=msd*1e18;
% save('msd_inert_time.mat','msd');
load('msd_inert_time.mat');
plot((ind-1)*dt,msd(ind),'o','Color',c(1,:),'Markersize',10,'LineWidth',1); 
set(gca,'xscale','log','yscale','log')
xlim([0.5 20000]*dt);
ylim([msd(2)/5 msd(N-2)*5]);
labels('$t$ [$\mu$s]','MSD [nm$^2$]');


x = zeros(n,N);                                    % preallocating memmory for x
y = zeros(n,N);                                    % preallocating memmory for x
z = zeros(1,100*1.5*N);
dt = 1e-3;                                         % each time step is \tau
d1 = sqrt(2*kB*T/gamma*dt);                        % coefficient for langevin equation without mass

for i=1:N-1
    x(:,i+1) = x(:,i) + d1*wx(:,i);                   % simulation of the langevin equation with mass 
    y(:,i+1) = y(:,i) + d1*wy(:,i);                   % simulation of the langevin equation with mass 
%     x3(:,i+2) = x3(:,i+1) + c*x3(:,i+1) + d1*w(:,i);                   % simulation of the langevin equation with mass 
end
x = x - mean(x,2);
y = y - mean(y,2);

for i=1:(100*1.5*N-1)
    z(i+1) = z(i) + d1*wz(i);            % simulation of the langevin equation with mass
end

axes(a(1));
plot(x(1,:)*1e6,y(1,:)*1e6,'color',c(1,:),'LineWidth',1)
xlim([-3.9 3.9]);
ylim([-3.9 3.9]);
labels('$x$ [$\mu$m]','$y$ [$\mu$m]');


axes(a(4));
msd = zeros(1,N);
for i=2:N-1
    msd(i)=mean((x(:,i)-x(:,1)).^2+(y(:,i)-y(:,1)).^2);
end
msd = msd*1e12;
ind = round(exp(log(2):0.4:log(N)));
plot(dt*[1 1000]*5,msd(2)*[1 1000],'k--','LineWidth',2)
plot((ind-1)*dt,msd(ind),'.','Color',c(1,:),'Markersize',20); hold on;

% msd = zeros(1,N-1);
% for i=2:N-1
%     msd(i) = mean((z(i:end)-z(1:end-i+1)).^2)*2;
%     disp(i);
% end
% msd=msd*1e12;
% save('msd_free_time.mat','msd');
load('msd_free_time.mat');
plot((ind-1)*dt,msd(ind),'o','Color',c(1,:),'Markersize',10,'LineWidth',1); 

set(gca,'xscale','log','yscale','log')
labels('$t$ [s]','MSD [$\mu$m$^2$]');
xlim([0.5 20000]*dt);
ylim([msd(2)/5 msd(N-2)*5]);




x = zeros(n,1.2*N);                                    % preallocating memmory for x
y = zeros(n,1.2*N);                                    % preallocating memmory for x
zx = zeros(1,100*1.5*N);
zy = zeros(1,100*1.5*N);
dt = 1e-3;                                         % each time step is \tau
d1 = sqrt(2*kB*T/gamma*dt);                        % coefficient for langevin equation without mass
ck = -1e-6/gamma*dt;  

for i=1:1.2*N-1
    x(:,i+1) = x(:,i) + ck*x(:,i) + d1*wx(:,i);                   % simulation of the langevin equation with mass 
    y(:,i+1) = y(:,i) + ck*y(:,i) + d1*wy(:,i);                   % simulation of the langevin equation with mass 
end
x = x - mean(x,2);
y = y - mean(y,2);
x = x(:,N/5:end);
y = y(:,N/5:end);

wzy = randn(1,1.5*N*n-1);
for i=1:(100*1.5*N-1)
    zx(i+1) = zx(i)+ ck*zx(i) + d1*wz(i);            % simulation of the langevin equation with mass
    zy(i+1) = zy(i)+ ck*zy(i) + d1*wzy(i);            % simulation of the langevin equation with mass
end

axes(a(3));
plot(x(1,:)*1e9,y(1,:)*1e9,'color',c(1,:),'LineWidth',1)
xlim([-299 299]);
ylim([-299 299]);
labels('$x$ [nm]','$y$ [nm]');


axes(a(6));
msd = zeros(1,N);
for i=2:N-1
    msd(i)=mean((x(:,i)-x(:,1)).^2+(y(:,i)-y(:,1)).^2);
end
msd = msd*1e12;
ind = round(exp(log(2):0.4:log(N)));

plot((ind-1)*dt,msd(ind),'.','Color',c(1,:),'Markersize',20); hold on;
% msd = zeros(1,N-1);
% for i=2:N-1
%     msd(i) = mean((zx(i:end)-zx(1:end-i+1)).^2+(zy(i:end)-zy(1:end-i+1)).^2);
%     disp(i);
% end
% msd=msd*1e12;
% save('msd_trapped_time.mat','msd');
load('msd_trapped_time.mat');
plot((ind-1)*dt,msd(ind),'o','Color',c(1,:),'Markersize',10,'LineWidth',1); 
set(gca,'xscale','log','yscale','log')
labels('$t$ [s]','MSD [$\mu$m$^2$]');
plot(dt*[1 10000],msd(2)*[1 10000],'k--','LineWidth',2)
xlim([0.5 20000]*dt);
ylim([msd(2)/2 msd(N-2)*2*10]);
legend('Ensemble average','Time average','FontSize',14,'Interpreter','Latex','box','off','Location','Southeast')




