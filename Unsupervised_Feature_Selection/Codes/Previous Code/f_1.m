function y=f_1(U,V,X,H,W)% U \in N*K, V\in K*D, X \in N*D, H \in D*K
    %Setting Up Matrix Demension
    [N,D]=size(X);
    [N,K]=size(U);
    
    %Initialize Matrix
    result1(1:N*K)=0;
    result2(1:K*D)=0;
    
    for k=1:N
        for l=1:K
            for j=1:D
                result1((k-1)*K+l)=result1((k-1)*K+l)+2*(U(k,:)*V(:,j)-X(k,j))*V(l,j)*(W(k,j))^2;
            end
        end
    end

    for k=1:K
        for l=1:D
            for i=1:N
                result2((k-1)*D+l)=result2((k-1)*D+l)+2*(U(i,:)*V(:,l)-X(i,l))*U(i,k);
            end
        end
    end
   
    result=[result1,result2];
    y=result;
    