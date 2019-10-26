function y=norm_2_1(A)
    [n,d]=size(A);
    y=0;
    for i=1:n
        y=y+sqrt(A(i,:)*A(i,:)');
    end