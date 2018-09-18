function [root, fx, k, err] = simfpiter(f1, f2, xr, tol, N)

k = 0;

if N == 0
   return 
end

if f1(xr) == f2(xr)
    return
end

for k = 1 : N
    xrold = xr;
    yr = f1(xr);
    xr = f2(yr);
    if xr ~= 0
        err = abs((xr-xrold)/xr)*100;
    end
   
    if f1(xr) == f2(xr)
        err = 0;
    end
    
    if err < tol
        break
    end
    
end

root = xr;
fx = f1(xr)-f2(xr);