function y=f__(U,V,X,H,W)% U \in N*K, V\in K*D, X \in N*D, H \in D*K
    %Setting Up Matrix Demension
    [~,D]=size(X);
    [N,K]=size(U);
    
    % Initialize Hessian
    A=zeros(N*K+K*D);
    %{
    % The diagnal part of H
    for k=1:N
        for l=1:K
            for j=1:D
                A((k-1)*K+l,(k-1)*K+l)=A((k-1)*K+l,(k-1)*K+l)+2+2*V(l,j)^2*W(k,j)^2;
            end
        end
    end
   
    % The non-diagnal part of H
    for k=1:N
        for l=1:K
            for n=1:K
                if(l==n)
                    continue;
                end
                for j=1:D
                    A((k-1)*K+l,(k-1)*K+n)=A((k-1)*K+l,(k-1)*K+n)+2*V(n,j)*V(l,j)*W(k,j)^2;
                end
            end
        end
    end
    %}
    Block=2*(V*V'+eye(K));
    for i=1:N
        A((i-1)*K+1:i*K,(i-1)*K+1:i*K)=Block;
    end
    clear Block;
    %{
    %The diagnal and non-diagnal part of V
    for k=1:K
        for l=1:D
            for m=1:K
                for i=1:N
                    A(N*K+(k-1)*D+l,N*K+(m-1)*D+l)=A(N*K+(k-1)*D+l,N*K+(m-1)*D+l)+2*U(i,k)*U(i,m)*W(i,l)^2;
                end
            end
        end
    end
    %}
    Index=2*U'*U;
    I_=eye(D);
    for i=1:K
        for j=1:K
        A(N*K+(i-1)*D+1:N*K+i*D,N*K+(j-1)*D+1:N*K+j*D)=Index(i,j)*I_;
        end
    end
    clear Index I_
    
    
    %The part of H and V
    for k=1:K
        for l=1:D
            for m=1:N
                for n=1:K
                    if(n==k)
                        A((m-1)*K+n,N*K+(k-1)*D+l)=(2*V(n,l)*U(m,k)+2*(U(m,:)*V(:,l)-X(m,l)))*W(m,l)^2;
                    else
                        A((m-1)*K+n,N*K+(k-1)*D+l)=2*V(n,l)*U(m,k)*W(m,l)^2;
                    end
                end
            end
        end
    end
    
    %This is a symmatric matrix
    A(N*K+1:N*K+K*D,1:N*K)=A(1:N*K,N*K+1:N*K+K*D)';
    
    y=A;
    
    
    

    
        
                
            