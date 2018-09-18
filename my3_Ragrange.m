function y_int = my3_Ragrange(x, y, x_int)

n = length(x);
y_int = 0;

for i = 1 : n
    L = y(i);
    for j = 1 : n
        if i ~= j
            L = L*(x_int-x(j))/(x(i)-x(j));
        end
    end
    y_int = y_int + L;
end
