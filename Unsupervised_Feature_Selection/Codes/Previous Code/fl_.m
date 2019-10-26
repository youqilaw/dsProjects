function result=fl_(H,X,U,lambda) %U \in N*K, X \in N*D, H \in D*K
    [N,K]=size(U);
    [N,D]=size(X);
    
    result=zeros(1,D*K);
    
    for k=1:D
        for l=1:K
            for i=1:N
                result((k-1)*K+l)=result((k-1)*K+l)+2*(X(i,:)*H(:,l)-U(i,l))*X(i,k);
            end
            result((k-1)*K+l)=result((k-1)*K+l)+lambda*H(k,l)/norm_2(H(k,:));
        end
    end
