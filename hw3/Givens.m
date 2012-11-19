function [c s] = Givens(a, b)
% computes a Givens rotation to zero an element
% / c -s \ / a \ -  / r \
% \ s  c / \ b / -  \ 0 /
% Input: scalars a and b 
% Output: scalars s and c, satisfying c^2 + s^2 =1

% Here I am just shamelessly copying the Matlab code from class notes
c = 0 ;
s = 0 ;

if b == 0
    c = 1;
else
    if abs(b) > abs(a)
        tao = -a/b ;
        s = 1/ sqrt(1 + tao^2);
        c = s * tao;
    else
        tao = -b/a ;
        s = 1/ sqrt(1 + tao^2);
        c = s * tao;
    end
end

ss = s^2 + c^2 ;
display(ss);
