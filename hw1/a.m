function A = nagymatrix(n)

X = -4*ones(n-1,1) ;
X (n-1) = -2 ;
A = diag(X ,-1) ; % creates -4 

A = A + diag(ones(n-2,1),-2) ; % creates 1 

A = A + A'+ diag(6*ones(n,1)) ; % duplicates 

% special entries 
A(1,1) = 9 ;
A(n,n) = 1 ;
A(n-1,n-1)=5 ;
