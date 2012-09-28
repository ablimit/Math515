function A = sparsematrix(n)
% for assignment 3(b)
M = nagymatrix(n) ;
[B, d] = spdiags(M);
A = spdiags(B,d,M);
