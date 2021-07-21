%%
clear all; close all; clc; 

figure_pos = [0 0 800 400];

axes_pos = [[80 80 310 310]; 
            [480 80 310 310]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


%%
x0 = 1e-1;
v0 = 0e-2;
k = 5e+0;  % N/m
m = 1e-1;  % kg
b_crit = 2*sqrt(m*k);
b = 2*b_crit;  % N*s/m % overdamped
% b = b_crit;  % N*s/m % critically damped
b = 0.5*b_crit;  % N*s/m % underdamped
b = 0.1*b_crit;  % N*s/m % underdamped
% for critical damping:
% b = 2*sqrt(m*k)
gamma = b/(2*m); % 1/tau (exponential)
omega0 = sqrt(k/m); % rad/s
str_omega0 = [num2str(omega0,'%8.5f') ' rad/s'];
nu = omega0/(2*pi);   % Hz
str_nu = [num2str(nu,'%8.5f') ' Hz'];
T = 1/nu;   %
str_T = [num2str(T,'%8.5f') ' s'];
discr = gamma^2-omega0^2;

if discr <0
    fprintf('oscillating\n');
    damping = -1;
    strdamped = 'under_';
end
if discr==0
    fprintf('critical damping\n');
    damping = 0;
    strdamped = 'critically_';
end
if discr>0
    fprintf('overdamped\n');
    damping = 1;
    strdamped = 'over_';
end
list_dt = [0.002, 0.005, 0.01, 0.02];
str_list_dt = {'2 ms','5 ms','10 ms','20 ms'};
list_Niter = floor(4*T./list_dt);
list_jumps = round(0.02./list_dt);
for it = 1:numel(list_dt)
    
    dt = list_dt(it); % s
    
    Niter = floor(4*T/dt);
    
    if dt>T/20
        warning('dt>T/20 \n');
    end
    
    x = zeros(Niter+1,1);
    xh = zeros(Niter+1,1);
    v = zeros(Niter+1,1);
    Fx = zeros(Niter+1,1);
    
    x(1) = x0;
    v(1) = v0;
    Fx(1) = -k*x0;
    
    
    for i=1:Niter
        
        %         xh(i) = x(i) + v(i)*0.5*dt;
        %         Fx(i) = -k*xh(i)-b*v(i);
        %         v(i+1) = v(i) + Fx(i)/m*dt;
        %         x(i+1) = xh(i) + v(i+1)*0.5*dt;
        %         Fx(i+1) = -k*x(i+1);
        Fx(i) = -k*x(i)-b*v(i);
        x(i+1) = x(i) + v(i)*dt;
        v(i+1) = v(i) + Fx(i)/m*dt;
        
    end
    
    
    ta = (0:(Niter*10))*(dt/10);
    
    if damping == -1
        
        omega = sqrt(omega0^2-gamma^2);
        
        A = sqrt(x0.^2+(v0+gamma*x0).^2/omega0^2);
        phi = atan2(-(v0+gamma*x0)/omega0,x0);
        
        x_an = A*exp(-gamma*ta).*cos(omega*ta+phi);
        v_an = -gamma*A*exp(-gamma*ta).*cos(omega*ta+phi)-omega*A*exp(-gamma*ta).*sin(omega*ta+phi);
        e_an = A*exp(-gamma*ta);
    end
    
    if damping == 0
        
        A1 = x0;
        A2 = (v0+gamma*x0);
        
        x_an = A1*exp(-gamma*ta)+A2*ta.*exp(-gamma*ta);
        v_an = -gamma*A1*exp(-gamma*ta)-gamma*A2*ta.*exp(-gamma*ta)+A2*exp(-gamma*ta);
        e_an = A1*exp(-gamma*ta);
    end
    
    
    if damping == 1
        
        delta = gamma^2-omega0^2;
        
        A1 = 0.5*(x0+(v0+gamma*x0)/sqrt(delta));
        A2 = 0.5*(x0-(v0+gamma*x0)/sqrt(delta));
        lambda1 = (-gamma+sqrt(delta));
        lambda2 = (-gamma-sqrt(delta));
        
        x_an = A1*exp(lambda1*ta)+A2*exp(lambda2*ta);
        v_an = lambda1*A1*exp(lambda1*ta)+lambda2*A2*exp(lambda2*ta);
        e_an = A1*exp(-gamma*ta);
    end
    
    U_an = 0.5*k*x_an.^2;
    K_an = 0.5*m*v_an.^2;
    E_an = U_an+K_an;
    
    
    t = (0:Niter)*dt;
    
    K_sim = 0.5*m*v.^2;
    U_sim = 0.5*k*x.^2;
    E_sim = K_sim+U_sim;
    
    x_max(it) = max(abs(x));
    
    E_max(it) = max(abs(E_sim));
    
    td{it} = t;
    xd{it} = x;
    Ed{it} = E_sim;
    
    
    legentry{it} = str_list_dt{it};
    
end



legentry{numel(str_list_dt)+1} = 'Exact';

A0 = max(abs(x_max));
E0 = max(abs(E_max));
xmax = 1.3*max(abs(x_max));
Emax = 1.3*max(abs(E_max));




axes(a(1));
for it = 4
    plot(td{it}/T,xd{it}/A0,'.','color',c(1,:),'MarkerSize',10);
end





axes(a(2));
for it = 4
    plot(td{it}/T,Ed{it}/E0,'.','color',c(1,:),'MarkerSize',10);
end
















%%
x0 = 1e-1;
v0 = 0e-2;
k = 5e+0;  % N/m
m = 1e-1;  % kg
b_crit = 2*sqrt(m*k);
b = 2*b_crit;  % N*s/m % overdamped
% b = b_crit;  % N*s/m % critically damped
% b = 0.5*b_crit;  % N*s/m % underdamped
b = 0.1*b_crit;  % N*s/m % underdamped
% for critical damping:
% b = 2*sqrt(m*k)
gamma = b/(2*m); % 1/tau (exponential)
omega0 = sqrt(k/m); % rad/s
str_omega0 = [num2str(omega0,'%8.5f') ' rad/s'];
nu = omega0/(2*pi);   % Hz
str_nu = [num2str(nu,'%8.5f') ' Hz'];
T = 1/nu;   %
str_T = [num2str(T,'%8.5f') ' s'];
discr = gamma^2-omega0^2;
if discr <0
    fprintf('oscillating\n');
    damping = -1;
    strdamped = 'under_';
end
if discr==0
    fprintf('critical damping\n');
    damping = 0;
    strdamped = 'critically_';
end
if discr>0
    fprintf('overdamped\n');
    damping = 1;
    strdamped = 'over_';
end
list_dt = [0.002, 0.005, 0.01, 0.02];
str_list_dt = {'2 ms','5 ms','10 ms','20 ms'};
list_Niter = floor(4*T./list_dt);
list_jumps = round(0.02./list_dt);
for it = 1:numel(list_dt)
    dt = list_dt(it); % s
    Niter = floor(4*T/dt);
    if dt>T/20
        warning('dt>T/20 \n');
    end
    x = zeros(Niter+1,1);
    xh = zeros(Niter+1,1);
    v = zeros(Niter+1,1);
    Fx = zeros(Niter+1,1);
    x(1) = x0;
    v(1) = v0;
    Fx(1) = -k*x0;
    for i=1:Niter
        xh(i) = x(i) + v(i)*0.5*dt;
        Fx(i) = -k*xh(i)-b*v(i);
        v(i+1) = v(i) + Fx(i)/m*dt;
        x(i+1) = xh(i) + v(i+1)*0.5*dt;
        Fx(i+1) = -k*x(i+1);
    end
    ta = (0:(Niter*10))*(dt/10);
    if damping == -1
        omega = sqrt(omega0^2-gamma^2);
        
        A = sqrt(x0.^2+(v0+gamma*x0).^2/omega0^2);
        phi = atan2(-(v0+gamma*x0)/omega0,x0);
        
        x_an = A*exp(-gamma*ta).*cos(omega*ta+phi);
        v_an = -gamma*A*exp(-gamma*ta).*cos(omega*ta+phi)-omega*A*exp(-gamma*ta).*sin(omega*ta+phi);
        e_an = A*exp(-gamma*ta);
    end
    
    if damping == 0
        
        A1 = x0;
        A2 = (v0+gamma*x0);
        
        x_an = A1*exp(-gamma*ta)+A2*ta.*exp(-gamma*ta);
        v_an = -gamma*A1*exp(-gamma*ta)-gamma*A2*ta.*exp(-gamma*ta)+A2*exp(-gamma*ta);
        e_an = A1*exp(-gamma*ta);
    end
    
    
    if damping == 1
        
        delta = gamma^2-omega0^2;
        
        A1 = 0.5*(x0+(v0+gamma*x0)/sqrt(delta));
        A2 = 0.5*(x0-(v0+gamma*x0)/sqrt(delta));
        lambda1 = (-gamma+sqrt(delta));
        lambda2 = (-gamma-sqrt(delta));
        
        x_an = A1*exp(lambda1*ta)+A2*exp(lambda2*ta);
        v_an = lambda1*A1*exp(lambda1*ta)+lambda2*A2*exp(lambda2*ta);
        e_an = A1*exp(-gamma*ta);
    end
    
    U_an = 0.5*k*x_an.^2;
    K_an = 0.5*m*v_an.^2;
    E_an = U_an+K_an;
    
    
    t = (0:Niter)*dt;
        
    K_sim = 0.5*m*v.^2;
    U_sim = 0.5*k*x.^2;
    E_sim = K_sim+U_sim;
    x_max(it) = max(abs(x));
    E_max(it) = max(abs(E_sim));
    td{it} = t;
    xd{it} = x;
    Ed{it} = E_sim;
    legentry{it} = str_list_dt{it};
end
legentry{numel(str_list_dt)+1} = 'Exact';
A0 = max(abs(x_max));
E0 = max(abs(E_max));
xmax = 1.3*max(abs(x_max));
Emax = 1.3*max(abs(E_max));


axes(a(1));
set(gca,'fontname','times','FontSize',14)  % Set it to times
for it = 4
    plot(td{it}/T,xd{it}/A0,'.','color',c(3,:),'MarkerSize',10);
end
plot(ta/T,x_an/A0,'k--','LineWidth',2);
ylim([-1.29 1.29])
xlim([0 3.99]);
xlabel('$t/T$','Interpreter','latex','FontSize',22);
ylabel('$x(t)/A$','Interpreter','latex','FontSize',22);



axes(a(2));
set(gca,'fontname','times','FontSize',14)  % Set it to times
for it = 4
    plot(td{it}/T,Ed{it}/E0,'.','color',c(3,:),'MarkerSize',10);
end
ylabel('$E(t)/E_0$','Interpreter','latex','FontSize',22);
xlabel('$t/T$','Interpreter','latex','FontSize',22);
ylim([0 1.29]);
xlim([0 3.99]);
plot(ta/T,E_an/E0,'k--','LineWidth',2);
legend({'Euler','Leapfrog','Exact Solution'},'Interpreter','latex','Fontsize',14)
