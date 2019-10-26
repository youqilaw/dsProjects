function y=fl(H,X,U,lambda)
    A=U-X*H;
    y=f_norm(A)+lambda*norm_2_1(H);