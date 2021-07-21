clear all; close all; clc;

figure_pos = [0 0 1000 590];

axes_pos = [[68 330 225 240]; 
            [301 330 225 240];
            [534 330 225 240];
            [767 330 225 240];
            [68 70 225 240]; 
            [301 70 225 240];
            [534 70 225 240];
            [767 70 225 240]];

[h,a] = initfig(figure_pos,axes_pos);

colors = ['#0090B3';'#F2D314';'#34B400';'#E66C00'];
c = zeros(4,3);
for i=1:4
    c(i,:) = sscanf(colors(i,2:end),'%2x%2x%2x',[1 3])/255;
end

nf{1} = 'no_mn3_alpha_0.500L100_dt0.02_s1_1_s2_1.mat';
nf{2} = 'no_mn3_alpha_0.000L100_dt0.02_s1_0.1_s2_1.9.mat';
nf{3} = 'no_mn3_alpha_0.500L100_dt0.02_s1_0.1_s2_1.9.mat';
nf{4} = 'no_mn3_alpha_1.000L100_dt0.02_s1_0.1_s2_1.9.mat';

for i=1:4
    axes(a(i))
    load(nf{i},'Nbins','probability_density','list_iterations','L','dt');
    dx = L/Nbins;
    if mod(Nbins,2)
        xbins = (0:1:floor((Nbins-1)/2))*dx;
        xbins = [-xbins(end:-1:2), xbins];
    else
        xbins = dx/2+((1:round(Nbins/2))-1)*dx;
        xbins = [-xbins(end:-1:1), xbins];
    end
    bins_edges = [xbins-dx/2,xbins(end)+dx/2];
    list_Ttot = dt*list_iterations;
    if i==1
        for t = 1:numel(list_Ttot)
            cmw(t,:)=colormap(c(4,:)*t/numel(list_Ttot));
        end
    else
        for t = 1:numel(list_Ttot)
            cmw(t,:)=colormap(c(1,:)*t/numel(list_Ttot));
        end
    end
    for nr=1:numel(list_Ttot)
        plot(xbins,smooth(probability_density{nr}),'Color',cmw(nr,:),'LineWidth',2);
        %legentry{nr} = ['$T_{\rm tot} = ' num2str(list_Ttot(nr),'%5.0f') '$'];
        legend_x = [20 30]-3;
        yf = 0.12;
        dy = 0.01;
        plot(legend_x, yf -[1 1]*dy*nr,'Color',cmw(nr,:),'LineWidth',2)
        text(legend_x(2)+3,yf-dy*nr,['$10^' int2str(nr) '$ s'],'FontSize',14,'Interpreter','latex')
    end
%     plot(xbins([1 end]),[0 0]+1/L,'LineWidth',1);
    ylim([0 0.12]);
    xlim([-1 1]*L/2);
    set(gca,'xTick',[-40:20:40],'xTicklabel',{},'yTick',[]);
    if i==1
        labels('','$p(x)$')
    end
    
end

for i=1:4
    axes(a(i+4));
    load(nf{i},'Nbins','probability_density','list_iterations','L','dt');
    dx = L/Nbins;
    if mod(Nbins,2)
        xbins = (0:1:floor((Nbins-1)/2))*dx;
        xbins = [-xbins(end:-1:2), xbins];
    else
        xbins = dx/2+((1:round(Nbins/2))-1)*dx;
        xbins = [-xbins(end:-1:1), xbins];
    end
    bins_edges = [xbins-dx/2,xbins(end)+dx/2];
    list_Ttot = dt*list_iterations;
    if i==1
        for t = 1:numel(list_Ttot)
            cmw(t,:)=colormap(c(4,:)*t/numel(list_Ttot));
        end
    else
        for t = 1:numel(list_Ttot)
            cmw(t,:)=colormap(c(1,:)*t/numel(list_Ttot));
        end
    end
    for nr=numel(list_Ttot)
        fill([xbins xbins(end:-1:1)],[smooth(probability_density{nr}) 0*probability_density{nr}],...
            cmw(nr,:),'Facealpha',0.5,'Edgecolor','none');
    end
    if i==1
        text(0,0.07,'$\sigma = \sigma_0$','FontSize',16,'Interpreter','latex','HorizontalAlignment', 'center');
        text(0,0.09,'constant noise','FontSize',16,'Interpreter','latex','HorizontalAlignment', 'center');
    else
        text(0,0.07,'$\sigma = \sigma(x)$','FontSize',16,'Interpreter','latex','HorizontalAlignment', 'center');
        text(0,0.09,'multiplicative noise','FontSize',16,'Interpreter','latex','HorizontalAlignment', 'center');
        if i==2
            text(0,0.05,'no additional term','FontSize',16,'Interpreter','latex','HorizontalAlignment', 'center');
        end
        if i==3
            text(0,0.05,'add. drift: $\displaystyle \frac{\sigma(x_n)}{2}  \frac{\partial \sigma(x_n)}{\partial x} \Delta t$','FontSize',12,'Interpreter','latex','HorizontalAlignment', 'center');
        end
        if i==4
            text(0,0.05,'add. drift: $\displaystyle \sigma(x_n) \frac{\partial \sigma(x_n)}{\partial x} \Delta t$','FontSize',12,'Interpreter','latex','HorizontalAlignment', 'center');
        end
    end
    ylim([0 0.12]);
    xlim([-1 1]*L/2);
    set(gca,'xTick',[-40:20:40],'yTick',[]);
    if i==1
        labels('$x$','$p(x)$')
    else
        labels('$x$','');
    end
end
