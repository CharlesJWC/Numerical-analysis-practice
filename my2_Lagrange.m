function y_int = my2_Lagrange(x, y, x_int)

N = length(x);

y_int = 0;

for i = 1 : N
    L = y(i);
    for j = 1 : N
        if i ~= j
           L = L*(x_int-x(j))/(x(i)-x(j));  
        end
    end
    y_int = y_int + L;
end

