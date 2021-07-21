% figure for free, unbounded diffusion in 1 dimension
clear all;
close all;
clc;



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
%Ypix = by1+ywi+by2+ywi+by3; % 2 rows
Xpix = bx1+4*xwi+3*bx2+bx3;

data_axes{1} = [bx1, by1, xwi, ywi];
for i=2:4
    data_axes{i} = [bx1+(i-1)*(xwi+bx2), by1, xwi, ywi];
end
% data_axes{5} = [bx1, by1, xwi, ywi];
% for i=6:8
%     data_axes{i} = [bx1+(i-5)*(xwi+bx2), by1, xwi, ywi];
% end
data_figure = [Xpix, Ypix];

[fhi, ahi] = create_figure_structure(data_axes,data_figure);

Xpix0 = Xpix3x2;
Ypix0 = Ypix3x2;

[fh,ah] = standard_figure(Xpix0,Ypix0,fhi,ahi);

close(fhi);



fig_name_str = 'Fig07_1';


%%

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


for i=1:numel(list_Ttot)
    
    %  a - Lennard-Jones (Potential and force in the same graphics)
    set(gcf,'CurrentAxes',ah(i));
    set(gca,'fontsize',fsa-4);
    set(gca,'Ytick',[]);
    
    %set(gca,'Xtick',sigma*sqrt(list_Ttot(i))*[-1.2 0 1.2],'XtickLabel',{'$-\sigma \sqrt{t}$','','$\sigma \sqrt{t}$'},'TickLabelInterpreter','Latex');
    set(gca,'Xtick',sigma*sqrt(list_Ttot(i))*[-1 0 1],'XtickLabel',...
        {['$-\sigma_{' num2str(i) '}$\ \ \ '],'',['\ \ \ $\sigma_{' num2str(i) '}$']},'TickLabelInterpreter','Latex');
    %set(gca,'Xtick',[-50:10:50],'XtickLabel','');
    %set(gca,'TickLength',[0.02 0.02]);
    hold on;
    Px = exp(-(xbins-x0).^2/(2*sigma^2*list_Ttot(i)));
    Ax = sum(Px(:))*dx;
    Px = Px/Ax;
    plot(xbins,Px,'Color',cmw(i,:),'LineWidth',2);
    %legentry{nr} = ['$T_{\rm tot} = ' num2str(list_Ttot(nr),'%5.0f') '$'];
    if i==1
    legentry = ['$t_{' num2str(i) '} = ' ' t_0$'];
    else
    legentry = ['$t_{' num2str(i) '} = ' num2str(ratio(i),'%d') '\cdot t_0$'];
    end
    plot([-1 -1]*sigma*sqrt(list_Ttot(i)),[0 1/Ax*exp(-1/2)],'LineWidth',1,'Color',cmw(i,:));
    plot([1 1]*sigma*sqrt(list_Ttot(i)),[0 1/Ax*exp(-1/2)],'LineWidth',1,'Color',cmw(i,:));
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
    ylim([0 0.055]);
    xlim([-1 1]*L/2);
    %text(3.3,4,'Lennard-Jones',options_text_sm{:},options_align_rb{:});
    legend(legentry,options_legend{:},'Location','NorthEast');
    legend('boxoff');
    
    
    
end


%% panel labels
% position labels
dxl = -0.3*dxl0;
dyl = 0.8*dyl0;

% dxl_list = [2, 2, -0.3]*dxl0;
% dyl_list = 0.8*[1, 1, 1]*dyl0;

figure(fh);
[ahl] = write_labels(fh,ah,dxl,dyl,fspl);


saveas(gcf,[fig_name_str],'fig');
saveas(gcf,[fig_name_str],'epsc');




