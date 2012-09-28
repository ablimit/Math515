function sums = verify(n)
% for assignment 3(d)
X = -4*ones(n-1,1) ;
X (n-1) = -2 ;
A = diag(X ,-1) ; % creates -4 

A = A + diag(ones(n-2,1),-2) ; % creates 1 

A = A + A'+ diag(6*ones(n,1)) ; % generate 6 and duplicates matrix  

% special entries 
A(1,1) = 9 ;
A(n,n) = 1 ;
A(n-1,n-1)=5 ;

% generate new matrix 

B = diag(-2*ones(n-1,1) , 1) + diag(ones(n-2,1),2) + diag(ones(n,1)) ;  

B(1,1) = 2;

C = A - B * B' ;

sums = sum(sum(C));



