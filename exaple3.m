clear all; close all; clc;

x = [0:0.01:2*pi];
y =abs(sin(x));

figure;
hold on; plot(x,y); grid on;
%%
figure;
hold on; polar(x,y); grid on; % ���׳� ��ȣ ���� �׸��� ���� ���

clear all; close all; clc;

x = [-10:0.1:10];
Z = sinc(x)' * sinc(x);

X = x' * ones(1,201);
Y = ones(201,1) * x;


surf(X,Y,Z); shading flat % 3�������� �ٶ󺸱�
xlabel('X');
xlabel('Y');
xlabel('Z');

% �������� �ܰ躰�� Ȯ��

% 429ȣ ������