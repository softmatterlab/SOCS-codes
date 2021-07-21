clear all; close all; clc; 

figure_pos = [0 0 850 410];

axes_pos = [[70 80 320 320]; 
            [520 80 320 320]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));

n = 1000;
n0 = 10;
m = 1;
A = zeros(n,n);
avP = zeros(1,n);
C = zeros(1,n);
ind = round(n0*((n/n0).^(0.025)).^(1:40));
for i=1:n0
    for j = 1:n0
        if i~=j 
            A(i,j) = 1;
        end
    end
end
for i=1:(n-n0)
    D = sum(A)/sum(sum(A));
    edges = randsample(1:length(A), m, true,D);
%     while length(unique(edges))<3
%         edges = randsample(1:length(A), m, true,D);
%     end
%     tic;
    for j=1:m
        A(i+n0,edges(j))=1;
        A(edges(j),i+n0)=1;
    end
    if sum(i+n0==ind)>0
        avP(i+n0) = mean(mean(pathlength(A(1:i+n0,1:i+n0))));
%         si = 1:n0+i;
%         k = sum(A(si,si));
%         C(i+n0) = trace(A(si,si)^3)/(sum(k.*(k-1)));
        disp(i);
    end   
%     toc;
end
plot(ind,avP(ind),'.','Color',cc(1,:),'Markersize',15)



m = 3;
A = zeros(n,n);
avP = zeros(1,n);
C = zeros(1,n);
for i=1:n0
    for j = 1:n0
        if i~=j 
            A(i,j) = 1;
        end
    end
end
for i=1:(n-n0)
    D = sum(A)/sum(sum(A));
    edges = randsample(1:length(A), m, true,D);
    while length(unique(edges))<3
        edges = randsample(1:length(A), m, true,D);
    end
    for j=1:m
        A(i+n0,edges(j))=1;
        A(edges(j),i+n0)=1;
    end
    if sum(i+n0==ind)>0
        avP(i+n0) = mean(mean(pathlength(A(1:i+n0,1:i+n0))));
%         si = 1:n0+i;
%         k = sum(A(si,si));
%         C(i+n0) = trace(A(si,si)^3)/(sum(k.*(k-1)));
        disp(i);
    end   
end
plot(ind,avP(ind),'.','Color',cc(3,:),'Markersize',15)



m = 10;
A = zeros(n,n);
avP = zeros(1,n);
C = zeros(1,n);
for i=1:n0
    for j = 1:n0
        if i~=j 
            A(i,j) = 1;
        end
    end
end
for i=1:(n-n0)
    D = sum(A)/sum(sum(A));
    edges = randsample(1:length(A), m, true,D);
    while length(unique(edges))<3
        edges = randsample(1:length(A), m, true,D);
    end
    for j=1:m
        A(i+n0,edges(j))=1;
        A(edges(j),i+n0)=1;
    end
    if sum(i+n0==ind)>0
        avP(i+n0) = mean(mean(pathlength(A(1:i+n0,1:i+n0))));
%         si = 1:n0+i;
%         k = sum(A(si,si));
%         C(i+n0) = trace(A(si,si)^3)/(sum(k.*(k-1)));
        disp(i);
    end   
end
plot(ind,avP(ind),'.','Color',cc(2,:),'Markersize',15)
set(gca,'xscale','log','xTick',[10 100 1000]);
labels('$n$','$l$');
xlim([5 2000]);
ylim([0.5 5.9])
% plot(1+n0:n,log(1+n0:n)*avP(1+n0)/log(1+n0),'k--')
% plot(1+n0:n,log(1+n0:n)./log(log(1+n0:n))/1.2,'k--')



% C = zeros(1,20);
% n0 = 20;
% for m = 1:20
%     n = 1000;
%     A = zeros(n,n);
%     for i=1:n0
%         for j = 1:n0
%             if i~=j 
%                 A(i,j) = 1;
%             end
%         end
%     end
% 
% 
%     for i=1:(n-n0)
%         D = sum(A)/sum(sum(A));
%         edges = randsample(1:length(A), m, true,D);
%         while length(unique(edges))<m
%             edges = randsample(1:length(A), m, true,D);
%         end
%         for j=1:m
%             A(i+n0,edges(j))=1;
%             A(edges(j),i+n0)=1;
%         end
%     end
%     k = sum(A);
%     C(m==1:20) = trace(A^3)/(sum(k.*(k-1)));
%     disp(m);
% end
% save('barabasiC.mat','C');
load('barabasiC.mat');
axes(a(2));
plot(1:20,C,'.','Color',cc(1,:),'Markersize',20)
labels('$m$','$C$');
xlim([0 19.9]);
ylim([0 0.24]);

