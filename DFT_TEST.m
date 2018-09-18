clc; close all; clear;
n = 8; dt = 0.02; fs = 1/dt; T = n/fs;
tspan = (0:n-1)/fs;
y = 5 + cos(2*pi*12.5*tspan) + sin(2*pi*18.75*tspan);

Y = fft(y)/n;
f = (0:n-1)/T;
Y(1) = []; f(1) =[];

nyquist = fs/2;
f = (1:n/2)/(n/2)*nyquaist;
Pyy = abs(Y(1:n/2)).^2;
stem(f,Pyy);
% 
% figure;
% plot(tspan, y,'-ok');