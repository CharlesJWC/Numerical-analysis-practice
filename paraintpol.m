function [xm,fxm, k, err] = paraintpol(f,x1,x2, x3, tol, N)

k= 0;

if N ==0
    return
end

for k = 1 : N
    tmp = x2;
    x4 = x2 - 0.5*((x2-x1)^2*(f(x2)-f(x3))-(x2-x3)^2*(f(x2)-f(x1)))/((x2-x1)*(f(x2)-f(x3))-(x2-x3)*(f(x2)-f(x1)));
    
    if f(x4) < f(x2) 
        if x2 > x4
            x3 = x2;
        else
            x1 = x2;
        end
        x2 = x4;
    else
        x4 = min(x1,min(x2,x3));
        err = 0;
    end
    
    if x4 ~= 0
        err = abs(x4 - tmp/x4)*100;
    end
    
   if err < tol
       break;
   end
end

xm = x4; 
fxm = f(x4);