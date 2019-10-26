function y=f1(U,V,X,H,W)
    result1=W.*(X-U*V);
    y=f_norm(result1);