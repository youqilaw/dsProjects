function [Pi,Sigma2]=Update_Pi_Sigma2(Y,U,V,X)
    [N,D,K]=size(Y);
    N_K=0;
    Pi=0;
    Sigma2=0;
    
    for k=1:K
        A=0;
        for i=1:N
            for j=1:D
                A=A+Y(i,j,k);
            end
        end
        N_K(k)=A;
    end
    
    Sum=sum(N_K);
    
    for k=1:K
        Pi(k)=N_K(k)/Sum;
    end
    
    for k=1:K
        flag=0;
        for i=1:N
            for j=1:D
                flag=flag+Y(i,j,k)*(X(i,j)-U(i,:)*V(:,j))^2;
            end
        end
        Sigma2(k)=flag/N_K(k);
    end
        
    
    