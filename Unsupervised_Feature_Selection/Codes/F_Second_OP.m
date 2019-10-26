function y=F_Second_OP(H,X,U,lambda)
        y=f_norm(U-X*H)+lambda*norm_2_1(H);