function [q, err, iter] = my2_Romberg(func, a, b, tol, N)

n = 1;
I(1,1) = my2_trap(func,a,b,n);

for iter = 1 : N
    n = 2^iter;
    I(iter+1,1) = my2_trap(func,a,b,n);
   for k = 2 : iter +1
       j = 2 + iter - k;
      I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
   end
   
   err = 100*abs((I(1,iter+1)-I(2,iter))/I(1,iter+1));
   
   if err < tol
       break;
   end
end

q= I(1, iter+1);