function [x,err, i] =  Gauss_Seidel (A, b, x_init, lamda_in, tol, N)

[m, n]= size(A);

if m ~= n ||  n ~= length(b) || n ~= length(x_init)
   error('must be squre!'); 
end

x = x_init;

if lamda_in >=0 && lamda_in <=2
    lamda = lamda_in;
else
    lamda = 1;
end

for i = 1 : N
    pre_x = x;

    for k = 1 : n
        x(k) = (b(k) - A(k,1:k-1)*x(1:k-1) - A(k,k+1:n)*pre_x(k+1:n))/A(k,k);
        x(k) = lamda*x(k) + (1-lamda)*pre_x(k);
    end
    err = 100 * abs((x - pre_x)./x);
    
    if all(err < tol)
        break;
    end
end
