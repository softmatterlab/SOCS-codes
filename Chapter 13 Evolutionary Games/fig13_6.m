clear all; close all; clc; 

figure_pos = [0 200 900 370];

axes_pos = [[5 10 290 290]; 
            [305 10 290 290];
            [605 10 290 290]];


[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


axes(a(1));
L = 30;
R = 0.82;
s = 1.5;
N=7;
mu = 0.01;
S = round(rand(L,L))*7;
for t = 1:100
    S = pditer(S,R,s,N,L,mu);
end
imagesc(S);
xlim([0.5 L+0.5]);
ylim([0.5 L+0.5]);
title('$R= 0.82$','Fontsize',22,'Interpreter','Latex');
axis off; 

axes(a(2));
R = 0.84;
S = round(rand(L,L))*7;
for t = 1:100
    S = pditer(S,R,s,N,L,mu);
end
imagesc(S);
xlim([0.5 L+0.5]);
ylim([0.5 L+0.5]);
title('$R= 0.84$','Fontsize',22,'Interpreter','Latex');
axis off; 


axes(a(3));
R = 0.86;
S = round(rand(L,L))*7;
for t = 1:100
    S = pditer(S,R,s,N,L,mu);
end
imagesc(S);
xlim([0.5 L+0.5]);
ylim([0.5 L+0.5]);
title('$R= 0.86$','Fontsize',22,'Interpreter','Latex');
axis off; 



C = [c(4,:); c(1,:)];
colormap(C);