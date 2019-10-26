function y=Update_V(U,V,X,H,W,ACC)
    [K,D]=size(V);
    
    %Vectorize U and V
    x=vectorize(V);
    
    %DN Parameter
    lambda=0.01;
    
    %Setting Up Iteration Parameter
    Flag=1;
    x_=0;
    error=5;
    %Plot=[];
    Judge=1;
    
    while Judge
        d=vectorize(-2*U'*(X-U*V));
        %Hesse=V_Hessian(U,V,X,H,W);
        judge=1;
        while judge
            lambda=lambda*10;
            x_=x-(V_inverse(lambda,U,D,K)*d')';
            V_=unvectorize(x_,K,D);
            if f(U,V,X,H,W)<f(U,V_,X,H,W)
                judge=1;
            else
                judge=0;
            end
        end
        if((F_First_OP(U,V_,X,H,W)-F_First_OP(U,V,X,H,W))^2<0.1)
            Judge=0;
        else
            Judge=1;
        end
        x=x_;
        V=V_;
        clear x_ V_
        %Plot=[Plot,f(U,V,X,H,W)];
        lambda=lambda/10;
        Flag=Flag+1;
        %Flag
        %error
    end
    %plot(Plot);
    %hold on;
    y=V;