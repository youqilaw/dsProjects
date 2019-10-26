function [U,V]=DN(U,V,X,H,W,ACC)% U \in N*K, V\in K*D, X \in N*D, H \in D*K
    %Setting Up Matrix Demension
    [~,D]=size(X);
    [N,K]=size(U);
    
    %Vectorize U and V
    x_U=vectorize(U);
    x_V=vectorize(V);
    x=[x_U, x_V];
    
    %DN Parameter
    lambda=0.01;
    
    %Setting Up Iteration Parameter
    Flag=1;
    x_=0;
    error=5;
    %Plot=[];
    
    while error>ACC %& Flag<1000
        d=f_(U,V,X,H,W);
        Hessian=f__(U,V,X,H,W);
        Judge=1;
        while Judge
            lambda=lambda*10;
            %x_=x-(inv_block((Hessian+lambda*eye(N*K+D*K)),N,K,D)*d')';
            x_=x-((Hessian+lambda*eye(N*K+D*K))\d')';
            U_=unvectorize(x_(1:N*K),N,K);
            V_=unvectorize(x_(N*K+1:N*K+K*D),K,D);
            if f(U,V,X,H,W)<f(U_,V_,X,H,W)
                Judge=1;
            else
                Judge=0;
            end
        end
        error=f_norm(x_-x)/(N*K+K*D);
        x=x_;
        U=U_;
        V=V_;
        clear x_ U_ V_
        %Plot=[Plot,f(U,V,X,H,W)];
        lambda=lambda/10;
        Flag=Flag+1;
        Flag
        error
    end
    %plot(Plot);
    %hold on;

    