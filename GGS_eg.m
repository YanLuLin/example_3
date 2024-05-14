function [IT,CPU,RES]=GGS_eg(m)
n=m^2;
eta=1.0e-6;
maxit=300;
[A,b,xk] = eg_3(m);
[IT,CPU,RES]=GGS(n,A,b,xk,eta,maxit);
