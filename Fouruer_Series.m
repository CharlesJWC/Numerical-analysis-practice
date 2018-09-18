function [] = Fouruer_Series(N)
close all;

t = linspace(-2, 2, 10000);
w0 = pi;
y = zeros(1,length(t));


for k = 1 : N
    y = y + (4/(pi*(2*k-1)))*(-1)^(k+1)*cos((2*k-1)*w0.*t);
end

%y = 4/pi*cos(w0.*t); - 4/(3*pi)*cos(3*w0.*t);
plot(t,y);
