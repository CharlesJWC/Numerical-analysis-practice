clear, clc, format short g

A=[5.5556 -2.7778 0 0;-2.7778 5.5556 -2.7778 0; ... 
    0 -2.7778 5.5556 -2.7778;0 0 -2.7778 5.5556];

A=inv(A);

x=[1 1 1 1]';

for i = 1:11
    disp('Iteration:');
    x=A*x; 
    e=max(x);
    x=x/e;
end
e = 1/e

xn=x/norm(x)