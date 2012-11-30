function uplotter(n)

x = linspace(0,1,n+2);
% y = linspace(0,1,n+2);
[X,Y] = meshgrid(x);
Z = funu(X,Y);
mesh(Z);
%surf(X,Y,Z)
