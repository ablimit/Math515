function x = kronLS(A1,A2,b1,b2)

% The function solves the LS problem:
%    || / kron(A1,A2) \     / b1 \  ||
% min|||               | x |      | ||
%    || \ kron(A2,Aa) /     \ b2 /  ||
%  
% Input: A1 - n-by-n  nonsingular matrix
%        A2 - n-by-n  nonsingular matrix
%        b1 - vector of length n^2
%        b2 - vector of length n^2
%
% Output: the solution 

% calculate the gsvd of A1 and A2
[U,V,Y,C,S] = gsvd(A1,A2);

% use the property of kronecker products b1= kron(U',V')b 
% copy the code from assignment sheet
UT = U' ;
VT = V' ;

%[m n] = size(UT);
%[p q]  = size(VT);
B = reshape(b1, n, n) ;
Y = VT * B * U ;
b1 = reshape (Y, n*n, 1);

B = reshape(b2, n, n);
Y = UT * B * V ;
b2 = reshape (Y, n*n, 1);








