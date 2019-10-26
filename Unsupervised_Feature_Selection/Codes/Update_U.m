function y=Update_U(U,V,X,H,W,ACC)
    [N,K]=size(U);
    
    %Vectorize U and V
    x=vectorize(U);
    
    %DN Parameter
    lambda=0.01;
    
    %Setting Up Iteration Parameter
    Flag=1;
    x_=0;
    error=5;
    %Plot=[];
    Judge=1;
    
    while Judge
        d=vectorize(-2*(X-U*V)*V'+2*(U-X*H));
        Hesse=U_Hessian(U,V,X,H,W);
        judge=1;
        while judge
            lambda=lambda*10;
            x_=x-(U_inverse(Hesse+lambda*eye(N*K),N,K)*d')';
            U_=unvectorize(x_,N,K);
            if f(U,V,X,H,W)<f(U_,V,X,H,W)
                judge=1;
            else
                judge=0;
            end
        end
        if((F_First_OP(U_,V,X,H,W)-F_First_OP(U,V,X,H,W))^2<0.1)
            Judge=0;
        else
            Judge=1;
        end
        x=x_;
        U=U_;
        clear x_ U_
        %Plot=[Plot,f(U,V,X,H,W)];
        lambda=lambda/10;
        Flag=Flag+1;
        %Flag
        %error
    end
    %plot(Plot);
    %hold on;
    y=U;