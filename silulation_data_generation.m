clear all; clc; close all; 

N = 8;
x = linspace(1,10,N);
y_exac = 2.*x+1;
y = y_exac + randn(1,N);


figure;

plot(x, y_exac,'b');
hold on; grid on;
plot(x,y,'ro');

A = [0 1; 1 mean(x)];
B = [(N*sum(x.*y)-sum(x)*sum(y))/(N*sum(x.*x)-(sum(x)*sum(x))); mean(y)];

a_n = A\B;

%a1 = (N*sum(x.*y)-sum(x)*sum(y))/(N*sum(x.*x)-(sum(x)*sum(x)))
%a0 = mean(y) - a1*mean(x)