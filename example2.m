clear all; close all; clc; 

%% 1st example

% ����� ������ ���� �־�� ��ũ�����̽� ������ ��
A = [1 2 3; 4 5 6; 7 8 9];
B1 = [1; 2; 3;];
B2 = [1 2 3]'; % ���� Ʈ��������
C = A * B1;

%% 
A = [1 2 3; 4 5 6; 7 8 9];
D = A*A;
E = A.*A;

% ���ǹ� for�� �˰��� �ӵ� ���� ������ .���� ���
for ii = 1 : 3 % 1���� 3����
   x(ii) = B2(ii) * B2(ii) 
end

for ii = 1 : 3 % 1���� 3����
   for jj = 1:3
   F(ii,jj) = A(ii,jj)^2;
   end
    x(ii) = B2(ii) * B2(ii) 
end

y = B2 .* B2;
z = B2.^2
% ��� ��� ����

%%
t = [0,0.01,10];
[y,y2] = Calculate_Sin_Cos(t);

figure;
hold on; plot(t,y,'-');
hold on; plot(t,y2,'--');
grid on;
xlabel('[sec]'); xlabel('[V]');

%�Լ����� ��ũ���� ���� ����ǰų� ��� �߰����־����

%%

syms x; % ���� x�� �ϳ� ����
u = solve(x^2-3*x+2 ==0,x); % ���ٴ� ==�� 
disp(y);
