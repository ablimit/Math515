function  A =prob2(n)
% returns the n by n matrix for problem 2.

% Input: scalars n
% Output: n by n matrix

% A = diag(n:-1:1);
A = zeros(n,n);
for i = 1:n
   A = A + diag(i:-1:1,n-i);
end

A = A + diag(n-1:-1:1,-1);

    

%diag(20*ones(19,1),1);