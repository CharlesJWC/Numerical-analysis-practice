function [a0, a1] = linear_reg(x, y)

N = length(x);

A_LS = [N, sum(x);sum(x), sum(x.^2)];
b_LS = [sum(y(1:N)); sum(y(1:N).*x)];

an_LS = A_LS\b_LS;

a0 = an_LS(1);
a1 = an_LS(2);

end

