clear all; close all; clc; 
figure_pos = [0 0 600 500];

axes_pos = [[80 80 410 410]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#34B400';'#F2D314';'#E66C00';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

N = 1000;
n = 100;
d = 0.8;
Brange = 0.025:0.025:1;
rr  = 2:2:80;
% av = 3;
% Rinf = zeros(length(Brange),length(rr));
% for i=1:length(Brange)
%     for j=1:length(rr)
%         R = 0;
%         for repeat=1:av
%             R = R+calculate_Rinf(N,n,d,Brange(i),Brange(i)/rr(j));
%         end
%         Rinf(i,j) = R/av;
%         disp(j)
%     end
% end
% save('Rinf.mat','Rinf')


load('Rinf.mat')


n = 100;
for i=1:n
    C(i,:)=c(1,:)*(1-(i-1)/n)+c(4,:)*(i-1)/n;
end

surf(Brange,rr,Rinf','edgecolor','none');
% view(2);
xlim([Brange(1) Brange(end)]);
ylim([rr(1) rr(end)]);
labels('$\beta$','$\beta/\gamma$')
title('$R_{\infty}$','FontSize',22,'Interpreter','latex');
colormap(C)

