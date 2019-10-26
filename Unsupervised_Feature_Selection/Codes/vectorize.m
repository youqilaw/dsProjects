function y=vectorize(A) % Vectorize a matrix by row
    
    Dim=size(A);
    m=Dim(1,1);
    n=Dim(1,2);
    % Determine the demension of the input
    
    x=[];
    for i=1:m
        for j=1:n
            x=[x,A(i,j)];
        end
    end
    y=x;