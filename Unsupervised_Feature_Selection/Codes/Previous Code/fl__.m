function result=fl__(H,X,U,lambda) %U \in N*K, X \in N*D, H \in D*K
    [~,K]=size(U);
    [N,D]=size(X);
    
    result=zeros(D*K);
    %{
    %The diagnal part of the Hessian
    for k=1:D
        for l=1:K
            result((k-1)*K+l,(k-1)*K+l)=2*X(:,k)'*X(:,k);
            result((k-1)*K+l,(k-1)*K+l)=result((k-1)*K+l,(k-1)*K+l)+(lambda*(norm2(H(k,:))-H(k,l)))/(norm_2(H(k,:))^2);
        end
    end
    %}
    
    %The non-diagnal part of the Hessian
    for k=1:D
        for l=1:K
            for m=1:D
                for n=1:K
                    if(k==m & l==n)
                        result((k-1)*K+l,(k-1)*K+l)=2*X(:,k)'*X(:,k);
                        result((k-1)*K+l,(k-1)*K+l)=result((k-1)*K+l,(k-1)*K+l)+(lambda*(norm_2(H(k,:))-H(k,l)))/(norm_2(H(k,:))^2);
                    end
                    if(k~=m & l==n)
                        for i=1:N
                            result((k-1)*K+l,(m-1)*K+n)=result((k-1)*K+l,(m-1)*K+n)+2*(X(i,k)*X(i,m));
                        end
                    end
                    if(k==m & l~=n)
                        result((k-1)*K+l,(m-1)*K+n)=-lambda*H(k,l)*(H(k,:)*H(k,:)')^(-1.5)*H(m,n);
                    end
                end
            end
        end
    end
        
        
        
        
        
        
        