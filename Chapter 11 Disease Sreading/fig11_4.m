clear all; close all; clc; 
figure_pos = [0 0 600 500];

axes_pos = [[80 80 510 410]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#F2D314';'#E66C00';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end
Brange = 0:0.03:1;
load('2g01.mat');
plot(Brange,mean(Rinf),'.','Color',c(1,:),'MarkerSize',25);
load('2g02.mat');
plot(Brange,mean(Rinf),'.','Color',c(2,:),'MarkerSize',25);
legend('$\gamma = 0.01$','$\gamma=0.02$','FontSize',16,'Interpreter','Latex','box','off','location','southeast')
labels('$\beta$','$R_{\infty}$');
ylim([0 999]);
%%
% 
% N = 1000;
% n = 100;
% d = 0.8;
% g = 0.01;
% Brange = 0:0.03:1;
% av = 100;
% Rinf = zeros(av,length(Brange));
% for i=1:length(Brange)
%     for j=1:av
%         Rinf(j,i) = calculate_Rinf(N,n,d,Brange(i),g);
%     end
%     disp(i)
% end
% save('g02.mat','Rinf');
% 
