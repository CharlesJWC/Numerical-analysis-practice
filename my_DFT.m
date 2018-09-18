function [f_r] = my_DFT(f)
close all;

N = length(f);
F = zeros(1, N);
w0 = 2*pi/N;

for k = 1: N
    for j = 1 : N
        F(k) = F(k) + f(j)*exp(-1i*k*w0*j);
    end
end

f_r = zeros(1, N);

for j = 1: N
    for k = 1 : N
        f_r(j) = f_r(j) + F(k)*exp(1i*k*w0*j);
    end
    f_r(j) = 1/N*f_r(j);
end
