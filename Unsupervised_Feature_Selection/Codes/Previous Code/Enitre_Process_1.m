%This testing is aiming at simply reconstruction and feature selection
%Also choosing the best value of K
%And try to find out what is selected after feature selection

% U \in N*K, V\in K*D, X \in N*D, H \in D*K

%Loading the testing data
load('test.mat')

%Setting the Parameter
N=90;        %Sample Number
D=90;        %Sample Demension
K=5;        %Feature Demension
lambda=0.1;    %LASSO Parameter

%Initialize Matrix
%load('test.mat');
%X=100*rand(N,D);
H=100*rand(D,K);
U=100*rand(N,K);
V=100*rand(K,D);

%Initialize MoG Parameter
Sigma2=[2,3,4,5];       %Sigma^2
Pi=0.25*ones(4);         %Pi
W=ones(N,N);              %Missing Data Matrix

%Initialize Looping Data
Flag=1;         %Looping Time
Judge=1;       %Looping Index

[U,V]=DN(U,V,X,H,W);
H=DNL(H,X,U,lambda);