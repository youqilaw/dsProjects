function y=Update_H(H,X,U,lambda)
    [~,D]=size(X);
    [~,K]=size(H);
    Judge=1;
    
    while Judge
        G_R=zeros(D);
        for i=1:D
            G_R(i,i)=1/sqrt(H(i,:)*H(i,:)');
        end
    
        H_=(lambda*G_R+X'*X)\X'*U;
        
        if((F_Second_OP(H,X,U,lambda)-F_Second_OP(H_,X,U,lambda))^2<0.1)
            Judge=0;
        else
            Judge=1;
        end
        H=H_;
        clear H_;
    end
    y=H;