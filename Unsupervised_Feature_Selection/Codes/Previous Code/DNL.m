function H=DNL(H,X,U,lambda)% U \in N*K, V\in K*D, X \in N*D, H \in D*K
    %Setting Up Matrix Demension
    [~,K]=size(U);
    [~,D]=size(X);
    
    %Vectorize H
    x=vectorize(H);
    
    %DN Parameter
    lambda1=0.01;
    
    %Setting Up Iteration Parameter
    Flag=1;
    x_=0;
    error=5;
    %Plot=[];
    
    while error>4 %& Flag<1000
        d=fl_(H,X,U,lambda);
        Hessian=fl__(H,X,U,lambda);
        Judge=1;
        while Judge
            lambda1=lambda1*10;
            x_=x-((Hessian+lambda1*eye(D*K))\d')';
            H_=unvectorize(x_,D,K);
            if fl(H,X,U,lambda)<fl(H_,X,U,lambda)
                Judge=1;
            else
                Judge=0;
            end
        end
        error=f_norm(x_-x)/(K*D);
        x=x_;
        H=H_;
        clear x_ H_
        %Plot=[Plot,fl(H,X,U,lambda)];
        lambda1=lambda1/10;
        Flag=Flag+1;
        Flag
    end
    %plot(Plot);
    %hold on;

    