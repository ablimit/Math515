function  u =krondstls(b)
% function dstls calculates the solutoion for homework problem (Tu =b)
% without explicitly constructing matrices T or Z. 
%
%Input:  b is a n by one vector
%Output: u is a n by one vector which is the solution to Tu=b

[nn a] = size(b); % get the size n 

n = sqrt(nn);
B = reshape(b,n,n);
B = idst(idst(B')')'; % Z'B Z
b = reshape(B,nn,1); % change back to a vector 

% theta is the small angle 
theta = pi/(n+1);
% construct the eigenvalue matrix D
d = 2*(ones(n,1)-cos(theta:theta:n*theta));

% apply the inverse of the eigenvalue matrix
for i=1:n
    for j=1:n
        b((i-1)*n+j) = b((i-1)*n+j) /(d(i)+d(j));
    end
end

B = reshape(b,n,n);
U = dst(dst(B)')';
u = reshape(U,nn,1);


