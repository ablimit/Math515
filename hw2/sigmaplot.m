function sigmaplot()

n = 100

% v is uniform random
v = rand(n,1);
A = VanderMatrix(v);
us = svd(A) ;
subplot(2,2,1);
semilogy(us);
title('Uniform');
axis([0 100 10^(-20) 10^50]);

% v is normal random
v = randn(n,1);
A = VanderMatrix(v);
ns = svd(A) ;
subplot(2,2,2);
semilogy(ns);
title('Normal')
axis([0 100 10^(-20) 10^50]);

% v is spaced random
v = linspace(0,1);
A = VanderMatrix(v);
ss = svd(A) ;
subplot(2,2,3); 
semilogy(ss);
title('Spaced');
axis([0 100 10^(-20) 10^50]);

% v is chebyshev random
for i = 1:1:n
    v(i)= cos((double(2*i -1))*pi/(double(2*n)));
end

A = VanderMatrix(v);
cs = svd(A) ;
subplot(2,2,4);
semilogy(cs);
title('Chebyshev');
axis([0 100 10^(-20) 10^50]);


