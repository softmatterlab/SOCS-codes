clear all; close all; clc; 

figure_pos = [0 0 800 410];

axes_pos = [[70 80 320 320]; 
            [470 80 320 320]];


[h,a] = initfig(figure_pos,axes_pos);


colors = ['#0090B3';'#E66C00';'#F2D314';'#34B400'];
cc = zeros(4,3);
for i=1:4
    cc(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

axes(a(1));

p_range = (0.00005)*(1.2190).^(1:50);
avP = zeros(1,length(p_range));
for t = 1:length(p_range)
    p = p_range(t);
    n = 500;
    A = zeros(n,n);
    k = 6; 
    phi = (1:n)/n*2*pi;
    xy= [sin(phi); cos(phi)]';
    for i=1:n
        for j=i+1:i+k/2
            ind = mod(j-1,n)+1;
            A(i,ind)=1;
            A(ind,i)=1;
        end
    end
    rewire = (A==1).*(rand(n,n)<p);
    for i=1:n
        for j=i+1:i+k/2
            ind = mod(j-1,n)+1;
            if rewire(i,ind)==1
                s = sum(sum(A));
                rwind = randsample( find(not(A(i,:))&(1:n~=i)), 1);
                A(i,rwind) = 1;
                A(rwind,i) = 1;
                A(i,ind) = 0;
                A(ind,i) = 0;
            end
        end
    end
    avP(t) = mean(mean(pathlength(A)));
end
plot(p_range,avP,'.','color',cc(1,:),'Markersize',25);
plot([1e-5 5],[1 1]*log(n)/log(k),'k--','LineWidth',2)
plot([1e-5 5],[1 1]*n/2/k,'k--','LineWidth',2)
set(gca,'xscale','log')
labels('$p$','$l$');




axes(a(2));

n_range = [50 1000];
marker = '.o';
msize = [25,10];
for t = 1:length(n_range)
    n = n_range(t);
    A = zeros(n,n);
    p = 0;
    c_range = 2:2:n-1;
%     c_range = c_range(c_range < n);
    C = zeros(1,length(c_range));
    for c=c_range
        beta = 0.2;
        phi = (1:n)/n*2*pi;
        xy= [sin(phi); cos(phi)]';
        for i=1:n
            for j=i+1:i+c/2
                ind = mod(j-1,n)+1;
                A(i,ind)=1;
                A(ind,i)=1;
            end
        end
        k = sum(A);
        C(c==c_range) = trace(A^3)/(sum(k.*(k-1)));
    end
    plot(c_range,C,marker(t),'Color',cc(t,:),'markersize',msize(t),'LineWidth',2);
end
plot(c_range,3*(c_range-2)./4./(c_range-1),'k--','LineWidth',2)
legend('$n=50$','$n=1000$','Theory','Interpreter','latex','Fontsize',16,'box','off','location','southeast');
set(gca,'xscale','log')
xlim([1.001 2e3]);
labels('$c$','$C$');