function y=f(U,V,X,H,W)
    result1=W.*(X-U*V);
    result2=U-X*H;
    y=f_norm(result1)+f_norm(result2);