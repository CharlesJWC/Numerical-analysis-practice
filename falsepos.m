function [root, fx, k, err] = falsepos(func,xl,xu,tol,N)

format long;

k=0;
xr = xu;
if N == 0
   return 
end

if sign(func(xl)) == sign(func(xu))
    return
end

for k = 1 : N
    xrold =  xr;
   
    xr = xu - func(xu)*(xu-xl)/(func(xu)-func(xl));
    
    if xr ~= 0
       err =  abs((xr-xrold)/xr)*100;
    end
    
    test = sign(func(xu))*sign(func(xr));
    
    if test > 0
        xu = xr;
    elseif test < 0
        xl = xr;
    else
        err = 0;
    end
    
    if err < tol
       break; 
    end
    
end

root = xr;
fx = func(xr);