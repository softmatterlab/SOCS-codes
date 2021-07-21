function [h,a] = squarefig(M,N)
    h = figure('Color','w','Units','Pixels','Position',[0 0  320*M+10 320*N+10]);
    labels=['\bf(a)'; '\bf(b)'; '\bf(c)'; '\bf(d)'; '\bf(e)'; '\bf(f)'; '\bf(g)'; '\bf(h)'; '\bf(i)'; '\bf(j)'];
    for m=1:M
        for n=1:N
            a(m,n) = axes('Units','Pixels','Position',[320*(m-1)+70  320*N-250-320*(N-n) 250 250]); box on;  hold on;
            text(10,230,labels((N-n)*M+m,:),'Units','Pixels','Fontsize',18,'Interpreter','Latex')
        end
    end
return
    
    
    
    
    
    