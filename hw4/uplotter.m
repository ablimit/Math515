function plotter(n)

x = linspace(0,1,n+2);
% y = linspace(0,1,n+2);

[X,Y] = meshgrid(x);

Z = funu(X,Y);
Z
mesh(Z)
%surf(X,Y,Z)

%set(gcf,'PaperPositionMode','auto');
%saveas(gcf,'sigmas.eps','eps2c');

%print('-dpsc2','-zbuffer','-r200')
