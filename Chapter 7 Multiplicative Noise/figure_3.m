% figure for spurious drift

clear all;
close all;
clc;


% fh1 = open('no_mn3_alpha_0.000_L100_dt0.02_s1_0.1_s2_1.9.fig');
% fh2 = open('no_mn3_alpha_0.500_L100_dt0.02_s1_0.1_s2_1.9.fig');
% fh3 = open('no_mn3_alpha_1.000_L100_dt0.02_s1_0.1_s2_1.9.fig');
% fh4 = open('no_mn3_alpha_0.500_L100_dt0.02_s1_1_s2_1.fig');


nf{1} = 'no_mn3_alpha_0.500L100_dt0.02_s1_1_s2_1.mat';
nf{2} = 'no_mn3_alpha_0.000L100_dt0.02_s1_0.1_s2_1.9.mat';
nf{3} = 'no_mn3_alpha_0.500L100_dt0.02_s1_0.1_s2_1.9.mat';
nf{4} = 'no_mn3_alpha_1.000L100_dt0.02_s1_0.1_s2_1.9.mat';

FiguresStandard;

bx1 = 80;
bx2 = 30;
bx3 = 10;
by1 = 80;
by2 = 20;
by3 = 10;

xwi = 300;
ywi = 300;
Ypix = by1+ywi+by2;  % 1 row
Ypix = by1+ywi+by2+ywi+by3; % 2 rows
Xpix = bx1+4*xwi+3*bx2+bx3;

data_axes{1} = [bx1, by1+ywi+by2, xwi, ywi];
for i=2:4
    data_axes{i} = [bx1+(i-1)*(xwi+bx2), by1+ywi+by2, xwi, ywi];
end
data_axes{5} = [bx1, by1, xwi, ywi];
for i=6:8
    data_axes{i} = [bx1+(i-5)*(xwi+bx2), by1, xwi, ywi];
end
data_figure = [Xpix, Ypix];

[fhi, ahi] = create_figure_structure(data_axes,data_figure);

Xpix0 = Xpix3x2;
Ypix0 = Ypix3x2;

[fh,ah] = standard_figure(Xpix0,Ypix0,fhi,ahi);

close(fhi);



fig_name_str = 'Fig07_2';
fig_name_str = 'Fig07_2a';


%%


for i=1:4
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
        cmw=colormap(copper(numel(list_Ttot)));
    else
        cmw=colormap(winter(numel(list_Ttot)));
    end
    
    %  a - Lennard-Jones (Potential and force in the same graphics)
    set(gcf,'CurrentAxes',ah(i));
    %set(gca,'fontsize',fsa);
    set(gca,'Ytick',[]);
    %set(gca,'Xtick',[-50:10:50],'XtickLabel',{'','-40','','-20','','0','','20','','40',''});
    set(gca,'Xtick',[-50:10:50],'XtickLabel','');
    %set(gca,'TickLength',[0.02 0.02]);
    hold on;
    for nr=1:numel(list_Ttot)
        plot(xbins,smooth(probability_density{nr}),'Color',cmw(nr,:),'LineWidth',2);
        %legentry{nr} = ['$T_{\rm tot} = ' num2str(list_Ttot(nr),'%5.0f') '$'];
        legentry{nr} = ['$' num2str(list_Ttot(nr),'%5.0f') '$ s'];
    end
    plot(xbins([1 end]),[0 0]+1/L,'LineWidth',1);
    % if i==1
    %     text(-48,0.10,'$\sigma = \sigma_0$',options_text_sm{:},options_align_lb{:});
    %     text(-48,0.112,'const. noise',options_text_sm{:},options_align_lm{:});
    % else
    %     text(-48,0.10,'$\sigma = \sigma(x)$',options_text_sm{:},options_align_lb{:});
    %     text(-48,0.112,'multip. noise',options_text_sm{:},options_align_lm{:});
    % end
    hold off;
    box on;
    if i==1
        ylabel('$P(x)$',options_label{:});
    end
    %xlabel('$x$',options_label{:});
    ylim([0 0.12]);
    xlim([-1 1]*L/2);
    %text(3.3,4,'Lennard-Jones',options_text_sm{:},options_align_rb{:});
    legend(legentry{:},options_legend{:},'Location','NorthEast');
    legend('boxoff');
    
    
    
end

for i=1:4
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
        cmw=colormap(copper(numel(list_Ttot)));
    else
        cmw=colormap(winter(numel(list_Ttot)));
    end
    
    %  a - Lennard-Jones (Potential and force in the same graphics)
    set(gcf,'CurrentAxes',ah(i+4));
    %set(gca,'fontsize',fsa);
    set(gca,'Ytick',[]);
    set(gca,'Xtick',[-50:10:50],'XtickLabel',{'','-40','','-20','','0','','20','','40',''});
    %set(gca,'TickLength',[0.02 0.02]);
    hold on;
    for nr=numel(list_Ttot)
        fill([xbins xbins(end:-1:1)],[smooth(probability_density{nr}) 0*probability_density{nr}],...
            cmw(nr,:),'Facealpha',0.5,'Edgecolor','none');
    end
    %plot(xbins([1 end]),[0 0]+1/L,'LineWidth',1);
    if i==1
        text(0,0.08,'$\sigma = \sigma_0$',options_text_sm{:},options_align_cb{:});
        text(0,0.11,'constant noise',options_text_sm{:},options_align_cb{:});
    else
        text(0,0.08,'$\sigma = \sigma(x)$',options_text_sm{:},options_align_cb{:});
        text(0,0.11,'multiplicative noise',options_text_sm{:},options_align_cb{:});
        if i==2
            text(0,0.05,'no additional term',options_text_sm{:},options_align_cb{:});
        end
        if i==3
            text(0,0.05,'add. drift: $\displaystyle \frac{\sigma(x_n)}{2}  \frac{\partial \sigma(x_n)}{\partial x} \Delta t$',options_text_sm{:},options_align_cb{:});
        end
        if i==4
            text(0,0.05,'add. drift: $\displaystyle \sigma(x_n) \frac{\partial \sigma(x_n)}{\partial x} \Delta t$',options_text_sm{:},options_align_cb{:});
        end
    end
    hold off;
    box on;
    if i==1
        ylabel('$P_{\rm eq}(x)$',options_label{:});
    end
    xlabel('$x$',options_label{:});
    ylim([0 0.12]);
    xlim([-1 1]*L/2);
    
    
    
end


%% panel labels
% position labels
dxl = 0.6*dxl0;
dyl = 0.8*dyl0;

% dxl_list = [2, 2, -0.3]*dxl0;
% dyl_list = 0.8*[1, 1, 1]*dyl0;

figure(fh);
[ahl] = write_labels(fh,ah,dxl,dyl,fspl);


saveas(gcf,[fig_name_str],'fig');
saveas(gcf,[fig_name_str],'epsc');

