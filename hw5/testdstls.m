function  u =dstls(b)
% function dstls calculates the solutoion for homework problem (Tu =b)
% without explicitly constructing matrices T or Z. 
%
%Input:  b is a n by one vector
%Output: u is a n by one vector which is the solution to Tu=b

[n a] = size(b); % get the size n 

% theta is the small angle 
theta = pi/(n+1);

% construct the inverse of eigenvalue matrix \Lambda
d = 2*(ones(n,1)-cos(theta:theta:n*theta));
d = ones(n,1)./d ;

% solution to the original problem Tu=b
u = dst(d.*idst(b));
