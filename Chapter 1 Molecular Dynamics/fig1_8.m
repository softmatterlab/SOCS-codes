clear all; close all; clc; 

figure_pos = [0 0 1000 500];

axes_pos = [[80 80 400 400]; 
            [580 80 400 400]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end





axes(a(2));
set(gca,'fontname','times','FontSize',14)  % Set it to times

dirout = ['.' filesep 'BrDi_2_comp' filesep ];
fileprefix = 'BrownianDisk_2';
thetaang = (0:1:360)*pi/180;
load([dirout 'init_' fileprefix '.mat']);

load([dirout 'simulation_ ' fileprefix '_global' '.mat'],...
    'XX','YY','VXX','VYY','UP','KP','EP',...
    'Kgas','VAX','VAY','Tgas','ET','t_list');
[ MSD_dep, time_dep ] = MSDf( [XX, YY], Niter*dt );
save([dirout 'data_disk_MSD.mat'],'XX','YY','MSD_dep','time_dep');

l = 1:21;
ind = round(1.198.^l);
plot(time_dep(ind),MSD_dep(ind),'.','Color',c(1,:),'MarkerSize',30); 
plot([0.125 1]*time_dep(end), [0.25 2]*MSD_dep(end),'k--','LineWidth',3)
text(0.15*time_dep(end),0.5*MSD_dep(end),'$\alpha = 1$','FontSize',18,'Interpreter','latex','Rotation',38)
set(gca,'Xscale','log','Yscale','log');
xlim([time_dep(2)/5 max(time_dep)*5]);
ylim([MSD_dep(2)/5 max(MSD_dep)*5])
ylabel('MSD [$\sigma_0^2$]','Interpreter','Latex','Fontsize',22);
xlabel('$\tau $ [$t_0$]','Interpreter','Latex','Fontsize',22);



axes(a(1));


dirout = ['.' filesep 'BrDi_2' filesep ];
fileprefix = 'BrownianDisk_2';
thetaang = (0:1:360)*pi/180;
load([dirout 'init_' fileprefix '.mat']);
irepeti = 80; % repetition number
if irepeti > Nrepeti
    irepeti = Nrepeti;
end
i = 800; % iteration inside repetition
if i > Niter
    i = Niter;
end
prop_arrow = {'StemWidth',2*[0.0250],'HeadWidth',2*[0.1000],'HeadLength',2*[0.1500],'HeadNode',2*[0.1000]};
mfg = 0.02;
mfd = 0.1;
mfr = 0.5;

ptraj = min([i, 900]);
traj_interval = i+1+(-ptraj:0);
load([dirout 'simulation_ ' fileprefix '_big_' num2str(irepeti) '.mat'],...
    'xb','yb','vbx','vby','Fbx','Fby',...
    'x','y','vx','vy','Fx','Fy','U');


% plot gas particles
fill(xb(i+1)+R*cos(thetaang),yb(i+1)+R*sin(thetaang),c(1,:)+ (1-c(1,:))/1.5,'EdgeColor','k');
for j=1:Npart
    fill(x(i+1,j)+mfr*rs*cos(thetaang),y(i+1,j)+mfr*rs*sin(thetaang),c(3,:),'EdgeColor','k');
end


load([dirout 'full_traj_disk.mat'],'XX','YY');
iglobal = Niter*(irepeti-1)+i+1;
plot(XX(1:iglobal),YY(1:iglobal),'Color',c(1,:),'Linewidth',2.5);

xlabel('$x$','Interpreter','Latex','Fontsize',22);
ylabel('$y$','Interpreter','Latex','Fontsize',22);
set(gca,'xtick',[],'ytick',[]);
