function u = gmressolver()

figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',14);
n = 256;
tol = 1e-8; 
maxit = 800; % in my experiments this values seems to be good enough
[A b] = genlsdata(n);

% without preconditioning 
[x,flag,relres,it0,rv0] = gmres(A, b, [], tol, maxit);
flag
tt = [0 0 0];

% preconditioning  0
setup.type = 'crout';
setup.droptol = 0;
tic ;
[L,U] = ilu(A,setup);
tt(1) = toc;
[x,flag,relres,it1,rv1] = gmres(A, b, [], tol, maxit,L,U);
flag

% preconditioning  0.1
setup.type = 'crout';
setup.droptol = 0.1;
tic ;
[L,U] = ilu(A,setup);
tt(2)= toc ;
[x,flag,relres,it2,rv2] = gmres(A, b, [], tol, maxit,L,U);
flag

% preconditioning  0.01
setup.type = 'crout';
setup.droptol = 0.01;
tic 
[L,U] = ilu(A,setup);
tt(2)= toc ;
[x,flag,relres,it3,rv3] = gmres(A, b, [], tol, maxit,L,U);
flag


u = x ;
tt
% http://www.mathworks.com/help/matlab/ref/pcg.html
figure;
semilogy(0:it0(2),rv0./norm(b),'b.');
hold on ;
semilogy(0:it1(2),rv1./norm(b),'r.');
hold on ;
semilogy(0:it2(2),rv2./norm(b),'k.');
hold on ;
semilogy(0:it3(2),rv3./norm(b),'g.');
hold on ;
legend('No Preconditioner','LU(0)','LU(0.1)','LU(0.01)');
xlabel('Iteration number');
ylabel('Relative Residual');
