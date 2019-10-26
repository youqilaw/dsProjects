function y=F_First_OP(U,V,X,H,W)
    y=f_norm(W.*(X-U*V))+f_norm(U-X*H);