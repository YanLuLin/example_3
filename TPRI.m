function [IT,CPU,RES,omega,gamma,tau]=TPRI(n,A,b,xk,omega,gamma,tau,eta,maxit)
D=spdiags(diag(A),0,n,n);
L=-tril(A,-1);
U=-triu(A,1);
IT = 0;
tic;
while IT<maxit
    xk =((1/omega)*D-gamma*L-tau*U)\((((1/omega)-1)*D+(1-gamma)*L+(1-tau)*U)*xk+abs(xk)+b);
    RES=norm(b+abs(xk)-A*xk)/norm(b);
    if RES<eta          
        IT = IT+1;
        break
    end
    IT = IT+1;
end
CPU=toc;
