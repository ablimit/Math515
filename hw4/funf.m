function  Z = funf(x ,y)
% computes the Possion Equation for given inputs

% Input: scalars x and y
% Output: evaluated function value Z 
%yy = y.^2;
[a b] = size(x); 
onevec = ones(a,b);

% Z = 10* x .* (3*y + x.*y - 3*yy - x.*yy + 2 - 2*x).*exp(x); % 2nd problem
Z = 10*(y .*(onevec-y).*(2*x-onevec) + x.*(onevec-x).*(22*onevec-40.*y)).*exp(x); % 3rd problem

