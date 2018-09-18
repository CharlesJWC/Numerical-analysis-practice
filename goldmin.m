function [xm,fxm k, err] = goldmin(f,xl,xu,tol,N)

phi = (1+sqrt(5))/2;
k= 0;
if N ==0
    return
end

for k = 1 : N
    d = (phi-1)*(xu-xl);
    x1 = xl + d;
    x2 = xu - d;
    if f(x1) > f(x2)
        xopt = x1;
        xl = x2;
    else 
        xopt = x2;
        xu = x1;
    end
    
    if xopt ~= 0
        err = (2-phi)*abs((xu-xl)/xopt)*100;
    end
    
   if err < tol
       break;
   end
end

xm = xopt; 
fxm = f(xopt);