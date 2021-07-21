function [h,a] = initfig(figure_pos,axes_pos)
    h = figure('Color','w','Units','Pixels','Position',figure_pos);
    labels=['\bf{a}'; '\bf{b}'; '\bf{c}'; '\bf{d}'; '\bf{e}'; '\bf{f}'; '\bf{g}'; '\bf{h}'; '\bf{i}'; '\bf{j}'];
    for m=1:size(axes_pos,1)
        a(m) = axes('Units','Pixels','Position',axes_pos(m,:)); 
        box on;  hold on;
        text(15,axes_pos(m,4)-25,labels(m,:),'Units','Pixels','Fontsize',25,'Interpreter','Latex')
        set(gca,'fontname','times','FontSize',14)  % Set it to times
    end
return

   
    
    
    
    
    