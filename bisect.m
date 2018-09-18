function [root, fx, k, err] = bisect(func,xl,xu,tol,N)

k = 0;
xr = xl;

if sign(func(xu)) == sign(func(xl))
    return
end

if N == 0
    return;
end

for k = 1 : N
   xrold = xr;
   xr = (xl + xu)/2;
   if xr ~= 0
      err =  abs((xr-xrold)/xr)*100; 
   end
   test = sign(func(xl)) * sign(func(xr));
   if test < 0
       xu = xr;
   elseif test > 0
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
    