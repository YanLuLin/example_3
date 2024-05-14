function [opt_omega,opt_gamma,opt_IT,opt_cputime,res]=GAOR_eg(u,m,maxit,omega_0,omega_N,delta_omega,gamma_0,gamma_N,delta_gamma)
n=m^2;
eta=1.0e-6;
[A,b,xk] = eg_3(m);
N_omega=floor((omega_N-omega_0)/delta_omega);       
N_gamma=floor((gamma_N-gamma_0)/delta_gamma); 
H=[];
for j=1:N_omega
    omega(j)=omega_0+j*delta_omega;
    for k=1:N_gamma
        gamma(j,k)=gamma_0+k*delta_gamma;
        [IT(j,k),cputime(j,k),res(j,k),omega(j),gamma(j,k)]=GAOR(n,A,b,xk,u,omega(j),gamma(j,k),eta,maxit);
        y=[IT(j,k),cputime(j,k),res(j,k),omega(j),gamma(j,k)];
        H=[H;y];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sort_H=sortrows(H,[1,2]);
opt_IT=sort_H(1,1);
opt_cputime=sort_H(1,2);
res=sort_H(1,3);
opt_omega=sort_H(1,4);
opt_gamma=sort_H(1,5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
