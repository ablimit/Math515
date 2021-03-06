figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14);
k = 1;
t1 =zeros(26,1);
t2 =zeros(26,1);
for n = 5:30
    A1 = rand(n);
    A2 = rand(n);
    b1 = rand(n*n,1);
    b2 = rand(n*n,1);
    A = [kron(A1, A2); kron(A2, A1)];
    b = [b1 ; b2];
    t1(k) = 0;
    t2(k) = 0;
    for j = 1:50
        tic;
        x_backslash = A\b;
        t1(k) = t1(k) + toc;
        tic;
        x_KronLS = KronLS(A1, A2, b1, b2);
        t2(k) = t2(k) + toc;
    end
    t1(k) = t1(k)/50;
    t2(k) = t2(k)/50;
    error_nrm(k) = norm(x_backslash - x_KronLS)/norm(x_backslash);
    k = k+1;
    n
end
figure(1), clf
semilogy(5:30, t1, 'b-o', 'LineWidth', 2)
hold on;
semilogy(5:30, t2, 'r-s', 'LineWidth', 2)
xlabel('Dimension of A1 and A2')
ylabel('Time to solve (seconds)')
legend('Naive approach','Efficient approach','Location', 'NW')
figure(2), clf
semilogy(5:30,error_nrm, 'b-o', 'LineWidth', 2)
xlabel('Dimension of A1 and A2')
ylabel('norm of error in using KronLS')