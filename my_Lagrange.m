function y_int = my_Lagrange(x, y, x_int)

N = length(x);
S = 0;

for i = 1 : N
    L = y(i);
    for j = 1:N
        if i ~= j
            L = L * (x_int-x(j))/(x(i)-x(j));
        end
    end
    S = S + L;
end
y_int = S;
