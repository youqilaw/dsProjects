function y=U_inverse(A,N,K)
    Index=inv(A(1:K,1:K));
    y=zeros(N*K);
    
    for i=1:N
        y((i-1)*K+1:i*K,(i-1)*K+1:i*K)=Index;
    end
    