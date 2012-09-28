function A = VanderMatrix(x)

n = length(x);

A = ones(n,n);

[a b] =size(x);

if a == 1
    v = x';
else
    v = x;
end

for i = n-1:-1:1
    A(:,i) = A(:,i+1).*v ;
end
