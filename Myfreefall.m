clc; close all; clear all;

g = 9.81; cd = 0.25; m = 68.1;

dt = 1; dt1 = 0.5;

t = 0:dt:20; t1 = 0:dt1:20;

N = length(t); N1 = length(t1);

v = zeros(1,N); v1 = zeros(1,N1);

for i = 2 : N
    v(i) = v(i-1) + (g - cd/m*v(i-1)^2)*dt;
end

for i = 2 : N1
    v1(i) = v1(i-1) + (g-cd/m*v1(i-1)^2)*dt1;
end

figure;
plot(t,v,':b', t1, v1, '--r');
title('시간에 따른 자유낙하 속도 변화');
xlabel('t [s]'); ylabel('v [m/s]');
legend('\delta t = 1', '\delta t1 = 0.5');
grid on;

