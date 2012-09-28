function [x, y] =genhw1plot(n)
% for assignment 3(c)
x = 10:10:n;

j = n/10 ;

y = zeros(1,j);

for i = 1:1:j
    y(i) = timels(x(i));
end

% plot(x,y);
