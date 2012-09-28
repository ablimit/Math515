function expsigmaplot()

u = linspace(0,1);
v = linspace(0,1);

A = ExpMatrix(u,v);
s = svd(A) ; 
plot(s);
title('ExpMatPlot');
set(gcf,'PaperPositionMode','auto');
saveas(gcf,'sigmas.eps','eps2c');

%print('-dpsc2','-zbuffer','-r200')