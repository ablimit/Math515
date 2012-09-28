function A = ExpMatrix(x,y)

u = exp(-1 * x.^2);
v = exp(-3 * y.^2);

A = u*(v');

