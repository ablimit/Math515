function draweig()

figureHandle = gcf;
% make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',16);

% for i=10:10:100
%     A =prob2(i);
%     
%     y = condeig(A);
%     x = (i/10)*ones(size(y));
%     semilogy(x,y,'bo');
%     xlabel('n = x *10','FontSize',16);
%     ylabel('eigcond(A(n))','FontSize',16);
%     hold on;
% end

for i=50:50:1000
    A =prob2(i);
    
    y = condeig(A);
    x = (i/50)*ones(size(y));
    semilogy(x,y,'bo');
    xlabel('n = x *50','FontSize',16);
    ylabel('eigcond(A(n))','FontSize',16);
    hold on;
end