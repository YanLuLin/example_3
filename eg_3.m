function [A,b,xk] = eg_3(m)
n=m^2;
d=ones(m,1);
e=ones(n,1);
S=spdiags([-1.5*d 4*d -0.5*d],[-1 0 1],m,m);
M_hat=kron(speye(m,m),S)+spdiags([-1.5*e -0.5*e],[-m m],n,n);
A=sparse(M_hat+4*speye(n));
x_star=sparse(zeros(n,1)+(-1).^(1:n)');
b=A*x_star-abs(x_star);
xk =zeros(n,1);
end
