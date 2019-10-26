function y=FEntire(U,V,X,H,W,lambda)
    y=f_norm(W.*(X-U*V))+f_norm(U-X*H)+lambda*norm_2_1(H);