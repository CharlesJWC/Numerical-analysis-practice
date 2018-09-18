clear all; close all; clc;

format long;

N = 1000;
x0 = 0.5;
h = logspace(-10,-2,N);

d_forward = zeros(1,N);
d_backward = zeros(1,N);
d_central = zeros(1,N);

for II = 1 : N
        f1 = ex_4o4(x0-h(II));
        f2 = ex_4o4(x0);
        f3 = ex_4o4(x0+h(II));
        
        d_forward(II) = (f3-f2)./h(II);
        d_backward(II) = (f2-f1)./h(II);
        d_central(II) = (f3-f1)./(2.*h(II));
end

d_exact = d_ex_4o4(x0);      
px = h;
figure
grid on;               
loglog(px,abs((d_exact - d_forward)./d_exact), 'r');        
hold on;
loglog(px,abs((d_exact - d_backward)./d_exact), 'g');
hold on;
loglog(px,abs((d_exact - d_central)./d_exact), 'b', 4.3*10^-6, 10^-12, 'rO');


%plot(px, d_forward,'o-');

%xlim([10^-8, 10^-7]);
%O(h^2) O(h) slope 2배가 됨 에러 빨리 감소, 증가