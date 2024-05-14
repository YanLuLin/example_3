function [omega,gamma,tau,IT,CPU,RES]=TPRI_eg_qd(m,maxit,omega,gamma,tau)
n=m^2;
eta=1.0e-6;
[A,b,xk] = eg_3(m);
[IT,CPU,RES,omega,gamma,tau]=TPRI(n,A,b,xk,omega,gamma,tau,eta,maxit); 
