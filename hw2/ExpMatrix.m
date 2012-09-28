function A = ExpMatrix(x,y)

u = exp(-1*x.*x) ;
v = exp(-3*y.*y) ;

A = u*(v');
