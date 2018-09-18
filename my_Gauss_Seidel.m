function [x, err, iter] = my_Gauss_Seidel(A,b, x_init, tol,N)

[m, n] = size(A);

x = x_init;
for iter = 1 : N
    pre_x = x;
    
    for k = 1 : n
        x(k) = (b(k) - A(k,1:k-1)*x(1:k-1)- A(k,k+1:n)*pre_x(k+1:n))/A(k,k);
    end
   
    err = 100*abs((x-pre_x)./x);
   if err < tol
      break; 
   end
end