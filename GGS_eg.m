function [IT,CPU,RES]=GGS_eg(m)
eta=1.0e-6;
maxit=300;
[A,b,xk] = eg_3(m);
[IT,CPU,RES]=GGS(A,b,xk,eta,maxit);