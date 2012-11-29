function [A b]= genlsdata(n)

x = linspace(0,1,n+2);
x = x(2:n+1);
hh = 1/((n+1)*(n+1));

% generate A1 for one-dimensional case.
e =ones(n,1);

A1 = spdiags([-e 2*e -e],[-1 0 1],n,n);
A = kron(A1,speye(n)) + kron(speye(n),A1);

% generate right values
[X,Y] = meshgrid(x);
Z = funf(X,Y); % evaluate functions 
b = hh*Z(:); % reshape to get the f values

