function y=inv_block(Inv,N,K,D)
    y=zeros(N*K+K*D);
    
    %A=Inv(1:N*K,1:N*K);
    B=Inv(1:N*K,N*K+1:N*K+K*D);
    C=Inv(N*K+1:N*K+K*D,N*K+1:N*K+K*D);
    
    A_Inv=zeros(N*K,N*K);
    Block=eye(K)/Inv(1:K,1:K);
    for i=1:N
        A_Inv((i-1)*K+1:i*K,(i-1)*K+1:i*K)=Block;
    end
    clear Block
    
    Index=C-B'*A_Inv*B;
    Index_Inv=eye(K*D)/Index;
    y(1:N*K,1:N*K)=A_Inv+A_Inv*B*Index_Inv*B'*A_Inv;
  
    y(N*K+1:N*K+K*D,N*K+1:N*K+K*D)=Index_Inv;
    
    y(1:N*K,N*K+1:N*K+K*D)=-A_Inv*B*Index_Inv;
    y(N*K+1:N*K+K*D,1:N*K)=-Index_Inv*B'*A_Inv;
    
    