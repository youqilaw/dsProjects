function y=EStep(U,V,Sigma2,Pi,X) %x denote x_{i,j}, K_Mix is the number of mixtures
    y=0;
    K_Mix=size(Sigma2);
    K_Mix=K_Mix(2);
    Dim_X=size(X);
    N=Dim_X(1);
    D=Dim_X(2);
    for i=1:N
        for j=1:D
            B=0;
            for l=1:K_Mix
                B=B+Pi(l)*normpdf(X(i,j),U(i,:)*V(:,j),Sigma2(l));
            end
            for k=1:K_Mix
                A=Pi(k)*normpdf(X(i,j),U(i,:)*V(:,j),Sigma2(k));
                y(i,j,k)=A/B;
            end
        end
    end