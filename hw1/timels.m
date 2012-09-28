function tdiff = hwtime(n)

A = nagymatrix(n) ;
As = nagysparsematrix(n);
b = ones(n,1);

tic
x = A \ b ;

t = toc ;

tic

x = As \ b ;

ts = toc ;

tdiff = t - ts ;


