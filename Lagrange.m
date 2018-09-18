function y_int = Lagrange(x,y,xx)

N = length(x);
S = 0;

for i = 1: N
    L = y(i);
    for j = 1:N
        if i ~= j
            L = L*(xx-x(j))/(x(i)-x(j));
        end
    end
    S = S + L;
end
y_int = S;
    