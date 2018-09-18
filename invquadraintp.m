function [root, fx, k, err] = invquadraintp(f, x1, x2, x3, tol, N)

k = 0;
x_i = x1;
x_i1 = x2;
x_i2 = x3;

if N==0
    return
end


for k = 1 : N
    x_iold = x_i;
    x_i = x_i*f(x_i2)*f(x_i1)/((f((x_i)-f(x_i1))*(x_i-x_i2)) + x_i1*f(x_i2)*f(x_i)/((x_i1-x_i)*(x_i1-x_i2)) + x_i2*f(x_i1)*f(x_i1)/((x_i2-x_i1)*(x_i2-x_i));
    
    if x_i ~= 0
        err = abs((x_i- x_iold)/x_i)*100;
    end
    if f(x_i) ==0
       err = 0; 
    end
    
    if err <tol
        break;
    end
end

root = x_i;
fx = f(x_i)