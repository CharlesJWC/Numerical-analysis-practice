function [root, fx, k, err] = secant(f,x0, xp0,tol,N)

k = 0;
xr = x0;
xp = xp0;

if N == 0
    return
end

if f(x0) == 0
   disp("That's answer!");
   return
end

for k = 1:N
    xrold = xr;
    xr = xr - f(xr)*(xp-xr)/(f(xp) - f(xr));
    xp = xrold;
    if xr ~= 0
       err = abs((xr-xrold)/xr)*100; 
    end
    if f(xr) ==0
        err = 0;
    end
    
    if err < tol
        break;
    end
end

root = xr;
fx = f(xr);