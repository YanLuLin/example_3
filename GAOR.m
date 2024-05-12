 function [IT,CPU,RES,omega,gamma,xk]=GAOR(A,b,xk,u,omega,gamma,eta,maxit)
O=u*speye(size(A));
D=diag(diag(A));
L=-tril(A,-1);
U=-triu(A,1);
IT = 0;
tic;
while IT<maxit
    yk=A\(abs(xk)+b);
    xk =(O+D-gamma*L)\((O+(1-omega)*D+(omega-gamma)*L+omega*U)*xk+omega*abs(yk)+omega*b);
    RES=norm(b+abs(xk)-A*xk)/norm(b);
    if RES<eta         
        IT = IT+1;
        break
    end
    IT = IT+1;
end
CPU=toc;
