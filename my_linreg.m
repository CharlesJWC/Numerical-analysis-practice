function [a0, a1] = my_linreg(x, y)

n = length(x);

A = [ n, sum(x); sum(x), sum(x.^2)];
b = [ sum(y); sum(x.*y)];

a = A\b;

a0 = a(1);
a0 = a(2);

end