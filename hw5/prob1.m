function  prob1()
% computes the Possion Equation for given inputs

% Input: scalars x and y
% Output: evaluated function value Z
% construct the matrix

A = diag(20:-1:1)+ diag(20*ones(19,1),1);

[V D] = eig(A);
%V
D

C = condeig(A);
C

A(20,1) =1.0e-10;
[V D] = eig(A);
%V
D

