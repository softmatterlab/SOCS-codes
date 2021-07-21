clear all; close all; clc; 

h = figure('Color','w','Units','Pixels','Position',[0 0 600 400]);

colors = ['#0090B3';'#34B400';'#E66C00';'#F2D314';];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes('Units','Pixels','Position',[80 80 500 300]);

% R = 10;
% power = 7;
% alpha = zeros(R,power);
% for repeat = 1:R
%     for sss = 1:power
%         N = 8*2^sss;
%         T=false(N,N);
%         p=0.01;
%         f=0.2;
%         NF=1;
%         NN=1000;
%         n=1;
%         S=zeros(1,NN);
%         x=randi(N,1,NN); y=randi(N,1,NN);
%         while NF<NN
%             T=T|(rand(N,N)<p);
%             if rand<f
%                C=bwlabel(T,4);
%                if T(x(NF),y(NF))~= 0
%                T(C==C(x(NF),y(NF)))=false;
%                S(n)=sum(sum(C==C(x(NF),y(NF)))); 
%                n=n+1;
%                end
%               NF=NF+1;
%             end 
%         end
% 
%         s = sort(S(S>0))/N^2;
%         ranks = (length(s):-1:1)/length(s); 
%         alpha(repeat,sss) = 1-log(ranks(100)/ranks(1)) / log(s(100)/s(1));
%         disp(sss);
%     end
% end
% save('alphaconverge.mat');

load('alphaconverge.mat');

plot(1./(2.^(1:power)*8),mean(alpha),'.','Color',c(1,:),'MarkerSize',25); hold on;
for j = 1:power
    plot(1/(2.^(j)*8)*[1 1],mean(alpha(:,j))+[-1 1].*std(alpha(:,j)),'Color',c(1,:))
end
labels('$1/N$','$\alpha$');
set(gca,'xTick',fliplr(1./(8*2.^(1:power))),'xTicklabel',{'','1/512','','1/128','1/64','1/32','1/16'});
% xlim([4 16*2^power]);
[h,sd]= polyfit(1./(2.^(3:power)*8),mean(alpha(:,3:end)),1);
[fit,err] =  polyval(h,[0 1/16],sd);
plot([0 1/16],fit,'k--','LineWidth',2);

