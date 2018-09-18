clc;clear;close;

x = linspace(-6,3,10000);
f=2.*x./(4.+0.8.*x+x.^2.-0.2*x.^3);


plot(x,f); 
