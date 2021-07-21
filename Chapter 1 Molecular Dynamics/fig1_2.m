clear all; close all; clc; 

figure_pos = [0 0 1000 770];

axes_pos = [[70 395 295 300]; 
            [380 395 295 300];
            [690 395 295 300];
            [70 80 295 300]; 
            [380 80 295 300];
            [690 80 295 300]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


x0 = 1e-1;
v0 = 0e-2;
k = 5e+0;  % N/m
m = 1e-1;  % kg
omega = sqrt(k/m); % rad/s
str_omega = [num2str(omega,'%8.5f') ' rad/s'];
nu = omega/(2*pi);   % Hz
str_nu = [num2str(nu,'%8.5f') ' Hz'];
T = 1/nu;   %
str_T = [num2str(T,'%8.5f') ' s'];
list_dt = [0.0001, 0.002, 0.02];
str_list_dt = {'0.1 ms','2 ms','20 ms'};
list_Niter = floor(4*T./list_dt);
list_jumps = round(0.02./list_dt);


A = sqrt(x0.^2+v0.^2/omega^2);
phi = atan2(-v0/omega,x0);
E_0 = 1/2*k*A^2;
for it=1:3
    axes(a(it));
    set(gca,'fontname','times','FontSize',14)  % Set it to times
    % Simulate 
    dt = list_dt(it); % s
    Niter = floor(4*T/dt);
    if dt>T/20
        warning('dt>T/20 \n');
    end
    x = zeros(Niter+1,1);
    v = zeros(Niter+1,1);
    Fx = zeros(Niter+1,1);
    x(1) = x0;
    v(1) = v0;
    Fx(1) = -k*x0;
    for i=1:Niter
        [ x(i+1), v(i+1) ] = Euler_step( dt, x(i), v(i), m, Fx(i) );
        Fx(i+1) = -k*x(i+1);
    end
    t = (0:Niter)*dt;
    K_sim = 0.5*m*v.^2;
    U_sim = 0.5*k*x.^2;
    E_sim = K_sim+U_sim;
    x_max(it) = max([max(abs(x)),A]);
    ta = (0:(Niter*10))*(dt/10);
    x_an = A*cos(omega*ta+phi);
    v_an = -omega*A*sin(omega*ta+phi);
    K_an = 0.5*m*v_an.^2;
    U_an = 0.5*k*x_an.^2;
    E_an = K_an+U_an;
    E_max(it) = max([max(abs(E_sim)),0.5*k*A^2]);
    
    
    plot(t/T,x/A,'.','color',c(it,:),'MarkerSize',10);
    plot(ta/T,cos(omega*ta+phi),'k--','LineWidth',1.5)
%     xlabel('$t/T$','Interpreter','latex','FontSize',22);
    if it==1
        ylabel('$x(t)/A$','Interpreter','latex','FontSize',22);
    else
        set(gca,'yTickLabel',[])
    end
    set(gca,'xTickLabel',[]);
    ylim([-4.9 4.9]);
    xlim([0 3.9]);
    title(['$\Delta t = $' str_list_dt{it}],'Interpreter','latex','FontSize',22 );
    
    axes(a(it+3));
    set(gca,'fontname','times','FontSize',14)  % Set it to times
    plot(t/T,E_sim/E_0,'.','color',c(it,:),'MarkerSize',10);
    plot(t/T,t*0+1,'k--','LineWidth',1.5)
    xlabel('$t/T$','Interpreter','latex','FontSize',22);
    if it==1
        ylabel('$E(t)/E_0$','Interpreter','latex','FontSize',22);
    else
        set(gca,'yTickLabel',[])
    end
    ylim([0 5.9]);
    xlim([0 3.9]);
end
