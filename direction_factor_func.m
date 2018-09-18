clc; close all; clear all;

n = 10;

N = 80;
R = 50;

m_central = -R/N;
m_curve = (R-500)/(100-N);

y_right = 1000 - m_curve*100; 
y_left = 2000 + m_curve*100;

x1 = linspace(-100, -N, n);
y1 = m_curve.*x1 + y_left;

x2 = linspace(-N, N, 2*n);
y2 = m_central .* x2 + 1500;

x3 = linspace(N, 100, n);
y3 = m_curve.*x3 + y_right;


figure; grid on; hold on;
plot(x1,y1, 'ro');
plot(x2,y2, 'go');
plot(x3,y3, 'bo');
