function y=U_Hessian(U,V,X,H,W)
    [N,K]=size(U);
    y=zeros(N*K);
    
    Block=2*(V*V'+eye(K));
    for i=1:N
        y((i-1)*K+1:i*K,(i-1)*K+1:i*K)=Block;
    end
