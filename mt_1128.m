




t = 1:0.01:10;
r


N = length(t);
w0 = pi;
fact = -1;
F(1, :) = -cos(w0.*t);

for II = 2 : N
   fact = -fact;
   F(II, :) = F(II-1,:)  + fact.*cos((2*II -1) *w0.*t)./(2.*II-1);
end

F = -4./pi.*F;


figure
plot(t,rect_P, t,F(5,:),'--',t,F(100,:),'-');
grid


% Interpolating
% ��Ȯ�� inverse ���ϴ� �������� ���� �սǵ�. �̷����� ��� ������..
% Numerical error ���� �߻�
% 1 x^1 x^2 ... x^n  