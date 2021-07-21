clear all; close all; clc; 

figure_pos = [0 0 900 380];

axes_pos = [[80 80 260 260]; 
            [355 80 260 260];
            [630 80 260 260]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


load('isingmagnetization.mat');

axes(a(1));
for i=1:10
    plot((1:100001)/1000,mm(i,:),'Color',c(1,:));
end
labels('Steps [$10^3$]','$m$');
ylim([-1.09 1.09]);
xlim([0 99]);
title('$T<T_c$','FontSize',22,'Interpreter','latex')


axes(a(2));
for i=1:10
    plot((1:100001)/1000,mm(i+10,:),'Color',c(3,:));
end
labels('Steps [$10^3$]','');
set(gca,'yTicklabel',{});
ylim([-1.09 1.09]);
xlim([0 99]);
title('$T=T_c$','FontSize',22,'Interpreter','latex')

axes(a(3));
for i=1:10
    plot((1:100001)/1000,mm(i+20,:),'Color',c(4,:));
end
labels('Steps [$10^3$]','');
set(gca,'yTicklabel',{});
ylim([-1.09 1.09]);
xlim([0 99]);
title('$T>T_c$','FontSize',22,'Interpreter','latex')