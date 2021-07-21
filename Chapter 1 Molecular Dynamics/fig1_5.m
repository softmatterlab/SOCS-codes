clear all; close all; clc; 

figure_pos = [0 0 500 400];

axes_pos = [[80 80 415 310]]; 


[h,a] = initfig(figure_pos,axes_pos);


sigma = 1;
epsilon = 0.2;
x = (0.8:0.01:3)*sigma;

V = 4*epsilon*((x/sigma).^(-12)-(x/sigma).^(-6));




set(gca,'fontname','times','FontSize',14)  % Set it to times

plot(x/sigma,V/epsilon,'-k','LineWidth',2);
plot([0 3],[0 0],':k');
xlabel('$r \ [\sigma]$','Interpreter','latex','FontSize',22);
ylabel('$V(r) \ [\epsilon]$','Interpreter','latex','FontSize',22);
xlim([0 2.99]);
ylim([-1.29 5.9]);
