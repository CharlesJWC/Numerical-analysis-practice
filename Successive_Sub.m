function [x,err, i] =  Successive_Sub (x_init, lamda_in, tol, N)

n = length(x_init);
x = x_init;

if lamda_in >=0 && lamda_in <=2
    lamda = lamda_in;
else
    lamda = 1;
end

for i = 1 : N
    pre_x = x;

    for k = 1 : n
        x(k) = u(k, x, pre_x);
        x(k) = lamda*x(k) + (1-lamda)*pre_x(k);
    end
    err = 100 * abs((x - pre_x)./x);
    
    if all(err < tol)
        break;
    end
end

function f = u(num, x_new, x_old)

if num == 1
       f = sqrt(10-x_old(1)*x_new(2));
elseif num == 2
       f = sqrt((57-x_old(2))/3/x_new(1));
else
    f = 0;
end