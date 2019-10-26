function y=Update_W(Y,Sigma2)
    y=0;
    Dim0=size(Y);
    N=Dim0(1);
    D=Dim0(2);
    %K=Dim0(3);
    K=1;

    for i=1:N
        for j=1:D
            A=0;
            for k=1:K
                A=A+Y(i,j,k)/(2*pi*Sigma2(k));
            end
            y(i,j)=sqrt(A);
        end
    end
            
                