function [x,err, i] =  Jacobi_iter (A, b, x_init, tol, N)

[m, n]= size(A);

if m ~= n ||  n ~= length(b) || n ~= length(x_init)
   error('must be squre!'); 
end

x = zeros(n,1);

for i = 1 : N
    pre_x = x;

    for k = 1 : n
        x(k) = (b(k) - A(k,1:k-1)*pre_x(1:k-1) - A(k,k+1:n)*pre_x(k+1:n))/A(k,k);
    end
    err = 100 * abs((x - pre_x)./x);
    
    if all(err < tol)
        break;
    end
end
