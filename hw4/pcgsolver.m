function pcgsolver()

n = 256;
tol = 1e-8; 
maxit = 100;
[A b] = genlsdata(n);

% without preconditioning 
[x,flag,relres,it0,rv0] = pcg(A,b,tol,maxit);

% preconditioning  1
opts.type = 'ict';
L = ichol(A,opts);
[x,flag,relres,it1,rv1] = pcg(A,b,tol,maxit,L,L');

% preconditioning  2
opts.type = 'ict'; opts.droptol = 0.1;
L = ichol(A,opts);
[x,flag,relres,it2,rv2] = pcg(A,b,tol,maxit,L,L');

% http://www.mathworks.com/help/matlab/ref/pcg.html
figure;
semilogy(0:it0,rv0/norm(b),'b.');
hold on;
semilogy(0:it1,rv1/norm(b),'r.');
semilogy(0:it2,rv2/norm(b),'k.');
legend('No Preconditioner','IC(0)','IC(0.1)');
xlabel('iteration number');
ylabel('relative residual');
hold off;

