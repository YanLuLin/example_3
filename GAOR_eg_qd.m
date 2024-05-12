function [omega,gamma,IT,cputime,res]=GAOR_eg_qd(u,m,maxit,omega,gamma)
tol=1.0e-6;
[A,b,xk] = eg_3(m);
[IT,cputime,res]=GAOR(A,b,xk,u,omega,gamma,tol,maxit); 
