%This test is aiming at conducting noise eliminating together with feature
%selection (iterating all together)

% U \in N*K, V\in K*D, X \in N*D, H \in D*K

%Setting the Parameter
N=130;        %Sample Number
D=2400;        %Sample Demension
K=10;        %Feature Demension
lambda=0.1;    %LASSO Parameter

%Initialize Matrix
load('warpAR10P.mat');
%X=X(:,1:240);
%X=100*rand(N,D);
H=ones(D,K);
U=100*rand(N,K);
V=100*rand(K,D);

%Initialize MoG Parameter
Sigma2=[2,3,4,5];       %Sigma^2
Pi=0.25*ones(4);         %Pi
W=ones(N,D);              %Missing Data Matrix

%Initialize Looping Data
Flag=1;         %Looping Time
Judge=1;       %Looping Index
%Iteration_Times=1000;
Plot=[];
ACC=0.1;
%Looping
while Judge
    %Y=EStep(U,V,Sigma2,Pi,X);    
    %[Pi,Sigma2]=Update_Pi_Sigma2(Y,U,V,X);
    %W=Update_W(Y,Sigma2);
    %if length(Sigma2)>1 || Sigma2>0.2
            Plot=[Plot,FEntire(U,V,X,H,W,lambda)];
            %U_=Update_U(U,V,X,H,W,ACC);
            %V_=Update_V(U_,V,X,H,W,ACC);
            [U_,V_]=Update_U_V(U,V,X,H,W,ACC);
            %[U_,V_]=DN(U,V,X,H,W,ACC);
            H_=Update_H(H,X,U_,lambda);
            %H_=DNL(H,X,U,lambda);
    %end
    Flag=Flag+1;
    if((FEntire(U_,V_,X,H_,W,lambda)-FEntire(U,V,X,H,W,lambda))^2<0.1)
        Judge=0;
        %break;
    else
        Judge=1;
        %[judge,Sigma2,Pi]=Test(Sigma2,Pi);
    end
    H=H_;
    U=U_;
    V=V_;
    %ACC=ACC/5;
    clear H_ U_ V_
end

