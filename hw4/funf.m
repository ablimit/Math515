function  Z = funf(x ,y)
% computes the Possion Equation for given inputs

% Input: scalars x and y
% Output: evaluated function value Z 
yy = y.^2;
Z = 10 * x .* (3*y + x.*y -3*yy-x.*yy+2-2*x)*exp(x);

