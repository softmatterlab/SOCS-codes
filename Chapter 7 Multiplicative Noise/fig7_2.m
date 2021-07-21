clear all; close all; clc;

figure_pos = [0 0 1000 370];

axes_pos = [[68 70 225 240]; 
            [301 70 225 240];
            [534 70 225 240];
            [767 70 225 240]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end


L=200;
Nbins = 200;
dx = L/Nbins;
if mod(Nbins,2)
    xbins = (0:1:floor((Nbins-1)/2))*dx;
    xbins = [-xbins(end:-1:2), xbins];
else
    xbins = dx/2+((1:round(Nbins/2))-1)*dx;
    xbins = [-xbins(end:-1:1), xbins];
end
bins_edges = [xbins-dx/2,xbins(end)+dx/2];
list_Ttot = [60, 240, 960, 3840];
cmw=colormap(copper(numel(list_Ttot)));
sigma = 1;
x0 = 0;
ratio = round([60, 240, 960, 3840]/60);
times = {'','4','16','64'};

for i=1:length(list_Ttot)
    axes(a(i));
    Px = exp(-(xbins-x0).^2/(2*sigma^2*list_Ttot(i)));
    Ax = sum(Px(:))*dx;
    Px = Px/Ax;
    plot(xbins,Px,'Color',c(i,:),'LineWidth',2);
    plot([-1 -1]*sigma*sqrt(list_Ttot(i)),[0 1/Ax*exp(-1/2)],'LineWidth',1.5,'Color',c(i,:));
    plot([1 1]*sigma*sqrt(list_Ttot(i)),[0 1/Ax*exp(-1/2)],'LineWidth',1.5,'Color',c(i,:));
    title(['$t_{' int2str(i) '} = \ '  times{i}  't_0$'],'FontSize',22,'Interpreter','latex');
    set(gca,'xTick',[-1 1]*sigma*sqrt(list_Ttot(i)),'xTicklabel',{['-\sigma_' int2str(i) ' '], ['  \sigma_' int2str(i)]})
    set(gca,'yTick',[]);
    labels('$x$','')
    if i==1
        labels('$x$','$p(x)$')
    end
    ylim([0 0.055]);
    xlim([-1 1]*L/2.8);
end

