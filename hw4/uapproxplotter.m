function uapproxplotter(x)

n = 256;
Z = reshape(x,n,n);
mesh(Z);
%surf(X,Y,Z)
