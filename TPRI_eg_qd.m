function [omega,gamma,tau,IT,CPU,RES]=TPRI_eg_qd(m,maxit,omega,gamma,tau)
eta=1.0e-6;
[A,b,xk] = eg_3(m);
[IT,CPU,RES,omega,gamma,tau]=TPRI(A,b,xk,omega,gamma,tau,eta,maxit); 
