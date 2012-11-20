function x = KronLS(A1,A2,b1,b2)

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

% extract the size 
[m n] = size(A1);

% calculate the gsvd of A1 and A2
[U,V,Y,C,S] = gsvd(A1,A2);

% use the property of kronecker products b1= kron(U',V')b 
% copy the code from assignment sheet
UT = U' ;
VT = V' ;

% calculate b1 & b2 using kronecker product properties
% copied from Homework appendicies
B = reshape(b1, n, n) ;
X = VT * B * U ;
b1 = reshape (X, n*n, 1);

B = reshape(b2, n, n);
X = UT * B * V ;
b2 = reshape (X, n*n, 1);

% calculate the D 
diag1 = diag(C);
diag2 = diag(S);

% vectorize the D (non-zero entries)
d1 = kron(diag1,diag2);
d2 = kron(diag2,diag1);


% initial x 
x = zeros(n*n,1);

% using givens rotation to diagonalize 
for i = 1:n*n
    d1(i) = sqrt(d1(i)^2 + d2(i)^2);
    [c s] = Givens(d1(i),d2(i));
    a = b1(i);
    b = b2(i);
    b1(i) = c*a - s*b;
    b2(i) = c*a + s*b;
end

% calcualte x by direct division 
x = b1 ./ d1;

% Again, using Kron property to transform x back to original values 
% x = Z' * x
% copied from Homework appendicies
B = reshape(x,n,n);
X = Y' \ B / Y ;
x = reshape(X,n*n,1);

