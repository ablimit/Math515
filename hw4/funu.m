function  s = funu(x ,y)
% computes the Possion Equation for given inputs

% Input: scalars x and y
% Output: evaluated function value s 
yy = y.^2;

[a b] = size(x);
A = ones(a,b);
[a b] = size(y);
B = ones(a,b);

s = 10 * x .* y .*(A-x).*(B-y).*exp(x); % 2nd problem 
