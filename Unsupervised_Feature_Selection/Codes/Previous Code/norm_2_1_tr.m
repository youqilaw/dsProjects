function y=norm_2_1_tr(X)
    [M,~]=size(X);
    
    Diag=zeros(M);
    for i=1:M
        Diag(i,i)=1/sqrt(X(i,:)*X(i,:)');
    end
    
    TR=X'*Diag*X;
    y=sum(diag(TR));
    
    