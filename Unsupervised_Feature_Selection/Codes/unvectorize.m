function y=unvectorize(X,m,n)
    y=[];
    for i=1:m
        for j=1:n
            y(i,j)=X((i-1)*n+j);
        end
    end
    
    
