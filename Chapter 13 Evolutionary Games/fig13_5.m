clear all; close all; clc; 

figure_pos = [0 200 1000 530];

axes_pos = [[50 250 220 220]; 
            [50 10 220 220];
            [290 250 220 220]; 
            [290 10 220 220];
            [530 250 220 220]; 
            [530 10 220 220];
            [770 250 220 220]; 
            [770 10 220 220]];


[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end
C = [c(2,:); c(1,:)];

L = 30;
R = 0.9;
s = 1.5;
N=7;
mu = 0.0;

for i=1:4
    axes(a(1+2*(i-1)));
    S = ones(L,L)*7;
    number_defectors = i;
    for t = 1:number_defectors
        in = round(L*t/(number_defectors+1)); 
        S(in,in)=0;
    end
    imagesc(S);
    xlim([0.5 L+0.5]);
    ylim([0.5 L+0.5]);
    title([num2str(i) ' initial defectors'],'FontSize',18,'Interpreter','latex');
    axis off;
    
    
    for t = 1:20
        S = pditer(S,R,s,N,L,mu);
    end
    axes(a(2+2*(i-1))); 
    imagesc(S);
    xlim([0.5 L+0.5]);
    ylim([0.5 L+0.5]);
    axis off; 
end
colormap(C);

axes('Units','Pixels','Position',[0 0 1000 530]); 
text(30,85,'$t=20$','FontSize',22,'Interpreter','latex','Units','Pixels','Rotation',90);
text(30,325,'$t=0$','FontSize',22,'Interpreter','latex','Units','Pixels','Rotation',90);
axis off;



