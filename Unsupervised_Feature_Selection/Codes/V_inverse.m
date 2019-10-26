function y=V_inverse(lambda,U,D,K)
    y=zeros(D*K);
    Index=2*U'*U+lambda*eye(K);
    Index_Inv=inv(Index);
    I_=eye(D);
    for i=1:K
        for j=1:K
        y((i-1)*D+1:i*D,(j-1)*D+1:j*D)=Index_Inv(i,j)*I_;
        end
    end

    