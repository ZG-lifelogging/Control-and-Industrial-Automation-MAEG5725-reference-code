%% ENGG 5403 Linear System Theory and Design Design Prolem (H2 Control law to control the UAV with noise and disturbance)
%% LIU Kangcheng     SID:1155113950
clear;
clc;
A=  [0 0 1 0 0 0 0.0009 0 0;
     0 0 0 0.9992 0 0 -0.0389 0 0;
     0 0 -0.0302 -0.0056 -0.0003 585.1165 11.4448 -59.529 0;
     0 0 0 -0.0707 267.7499 -0.0003 0 0 0;
     0 0 0 -1 -3.3607 2.2223 0 0 0;
     0 0 -1 0 2.4483 -3.3607 0 0 0;
     0 0 0.0579 0.0108 0.0049 0.0037 -21.9557 114.2 0;
     0 0 0 0 0 0 -1 0 0;
     0 0 0 0.0389 0 0 0.9992 0 0];
 B=[0 0 0;
    0 0 0;
    0 0 43.3635;
    0 0 0;
    0.2026 2.5878 0;
    2.5878 -0.0663 0;
    0 0 -83.1883;
    0 0 -3.8500;
    0 0 0];
C1=[1 0 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0;
    0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 0 1];

D1=zeros(9,3);
E=[0 0 0;
   0 0 0;
   -0.0001 0.1756 -0.0395;
   0 0.0003 0.0338;
   0 0 0;
   0 0 0;
   -0.0002 -0.3396 0.6424;
   0 0 0;
   0 0 0];
C2=zeros(9);
D2=zeros(9,3);
I1=eye(9);
I2=eye(3);
xigma=0.1;
%matrices for the perturbed system
E1=[E xigma*I1 zeros(9,3)];
D_1=[D1 zeros(9,3) xigma*I1];
C_2=[C2;xigma*I1;zeros(3,9)];
D_2=[D2;zeros(9,3);xigma*eye(3)];
%calculate transmission zeros
tzero(A,E1,C1,D_1)
tzero(A,B,C_2,D_2)
%solve P and Q
P=h2care(A,B,C_2,D_2)
Q=h2care(A',C1',E1',D_1')
eig(P)
eig(Q)
%calculate the feedback gain and estimator gain
F=-((D_2'*D_2)^-1)*(D_2'*C_2+B'*P)
K=-(Q*C1'+E1*D_1')*(D_1*D_1')^-1
% Closed Loop Control
A_C=A+B*F+K*C1;
B_C=-K;
C_C=F;
% the matrices of the closed loop system
A_CL=[A B*C_C;B_C*C1 A_C];
eig(A_CL)
B_CL=[E1;B_C*D_1];
C_CL=[C_2 D_2*C_C];
D_CL=zeros(21,15);
%transfer function
syms s
%Ts=simplify(C_CL*(s*eye(18)-A_CL)^-1*B_CL)
%optimal value gamma2star
gms=sqrt(trace(E'*P*E)+trace((A'*P+P*A+C_2'*C_2)*Q))
%gms2 = gm2star(A,B,C_2,D_2,E)