function u = pcgsolver()

figureHandle = gcf;
set(findall(figureHandle,'type','text'),'fontSize',14);
n = 256;
tol = 1e-8; 
maxit = 800; % in my experiments this values seems to be good enough
[A b] = genlsdata(n);

% without preconditioning 
[x,flag,relres,it0,rv0] = pcg(A,b,tol,maxit);

tt = [0 0 0];
% preconditioning  0
opts.type = 'ict';opts.droptol = 0;
tic 
L = ichol(A,opts);
tt(1) = toc;
[x,flag,relres,it1,rv1] = pcg(A,b,tol,maxit,L,L');

% preconditioning  0.1
opts.type = 'ict'; opts.droptol = 0.1;
tic
L = ichol(A,opts);
tt(2)= toc ;
[x,flag,relres,it2,rv2] = pcg(A,b,tol,maxit,L,L');

% preconditioning  0.01
opts.type = 'ict'; opts.droptol = 0.01;
tic 
L = ichol(A,opts);
tt(3) = toc ;
[x,flag,relres,it3,rv3] = pcg(A,b,tol,maxit,L,L');

u = x ;
tt
% http://www.mathworks.com/help/matlab/ref/pcg.html
figure;
semilogy(0:it0,rv0./norm(b),'b.');
hold on ;
semilogy(0:it1,rv1./norm(b),'r.');
hold on ;
semilogy(0:it2,rv2./norm(b),'k.');
hold on ;
semilogy(0:it3,rv3./norm(b),'g.');
hold on ;
legend('No Preconditioner','ICT(0)','ICT(0.1)','ICT(0.01)');
xlabel('iteration number');
ylabel('relative residual');
