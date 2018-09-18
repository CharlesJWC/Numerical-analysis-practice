%%
clc; close all; clear all;

x = linspace(1,10,20);
N = length(x);
y_real = 2.*x+3 + rand(1,N);

[a0, a1] = linear_reg(x,y_real);
[a] = polyfit(x,y_real,1);

y_lr = a1.*x + a0;
y_pf = a(1).*x + a(2);
%y_lr = exp(a1.*x).*a0;

plot(x,y_real,'ok',x, y_lr,'b', x, y_pf,'--r');
%%
% 14.8

clc; close all; clear all;

x = [0.1  0.2  0.4  0.6  0.9  1.3  1.5  1.7  1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

[ln_a4, b4] = linear_reg(x,log(y./x))

%polyfit(x,log(y./x),1)

ln_y_x = ln_a4 + b4.*x;

a4 = exp(ln_a4)
 
y_lr = a4.*x.*exp(b4.*x);

figure; 
plot(x, ln_y_x);

figure;
plot(x, y_lr, 'r', x, y, '--');

%%
clc; close all; clear all;

c = [0.5 0.8 1.5 2.5 4];
k = [1.1 2.5 5.3 7.6 8.9];

[one_kmax, cs_kmax]= linear_reg(1./(c.^2), 1./k);

x_lr = 1./(c.^2);
y_lr = one_kmax + cs_kmax.*x_lr;

figure;
plot(x_lr, y_lr)

kmax = 1./one_kmax;

cs = cs_kmax*kmax;

k_ap = (kmax.*c.^2)./(cs + c.^2);

figure
plot(c,k,'--', c, k_ap, 'r')


%%

clc; close all; clear all;

T = [0 5 10 20 30 40];
u = [1.787 1.519 1.307 1.002 0.7975 0.6529];

Ta = T + 273.15;

[a0, a1] = linear_reg(1./Ta, log(u));

B = a1
D = exp(a0)

u_lr = D.*exp(B./Ta);

plot(T, u_lr,'-o');

%%

x = [0 1 2 3 4 5 ]';
y = [2.1 7.7 13.6 27.2 40.9 61.1]';

Z = [ones(size(x)) x x.^2];


[a, y_lr] = lin_reg_general(Z, y);

plot(x, y_lr,'r',x,y,'--');

%%

U = [0.5, 2 10 0.5 2 10 0.5 2 10]';
H = [0.15 0.15 0.15 0.3 0.3 0.3 0.5 0.5 0.5]';
KL=[0.48 3.9 57 0.85 5 77 0.8 9 92]';

N = length(U);

Z = [ones(N,1), log10(U), log10(H)];

a = lin_reg_general(Z,log10(KL))

%%
clc; close all; clear all;
t = [0.5 1 2 3 4 5 6 7 9]';
p = [6 4.4 3.2 2.7 2 1.9 1.7 1.4 1.1]';

Z = [exp(-1.5.*t) exp(-0.3.*t) exp(-0.05.*t)];

[a y] = lin_reg_general(Z, p)

plot(t, y) 
%%
close all; clc; clear;

T = [0 5 10 20 30 40]';
u = 10^-3.*[1.787 1.519 1.307 1.002 0.7975 0.6529]';

plot(T,u,'o');

Z = [ones(length(T),1), T T.^2];

a = (Z'*Z)\(Z'*u);

y = Z*a;
hold on; grid on;
plot(T, y, 'r');

%%

close all; clc; clear;

T = [0 10 20 30 40]';
Ta = T + 273.15;
Kw = *[1.164*10^-15, 2.950*10^-15, 6.846*10^-15, 1.467*10^-14, 2.929*10^-14]';

Z = [ones(length(Ta),1) 1./Ta log10(Ta) Ta];

a = lin_reg_general(Z, -log10(Kw));

