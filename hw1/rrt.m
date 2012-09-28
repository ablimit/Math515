function x = rrt(b)
% for assignment 3(e)
n = length(b) ; % size of the vector
x = zeros(n,1) ; % prepare x , truncate later 
y = zeros(n+2,1) ; % prepare y 

for i = n:-1:1
    y(i) = b(i) + 2 * y(i+1) - y(i+2) ;
end

y(1) = y(1)/2 ;

y = y(1:n) ; % real y 

x(1) = y(1)/2; 
x(2) = y(2)+2*x(1);

for i = 3:1:n
    x(i) = y(i) + 2 * x(i-1) - x(i-2) ;
end

