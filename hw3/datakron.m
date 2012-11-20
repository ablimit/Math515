
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14);
load hw3_data;
n = size (A1,1);
figure(1), clf ;
subplot(3,2,1), imshow(reshape(b1,n,n),[]);
title ('b_1 Data');
subplot(3,2,2), imshow(reshape(b2,n,n),[]);
title ('b_2 Data');
x_KronLS = KronLS(A1,A2,b1,b2);
subplot(3,2,3), imshow(reshape(x_KronLS,n,n),[]);
title ('LS Solution');
subplot(3,2,5), imshow(A1,[]);
title ('A1');
subplot(3,2,6), imshow(A2,[]);
title ('A2');