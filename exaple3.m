clear all; close all; clc;

x = [0:0.01:2*pi];
y =abs(sin(x));

figure;
hold on; plot(x,y); grid on;
%%
figure;
hold on; polar(x,y); grid on; % 안테나 신호 패턴 그릴때 많이 사용

clear all; close all; clc;

x = [-10:0.1:10];
Z = sinc(x)' * sinc(x);

X = x' * ones(1,201);
Y = ones(201,1) * x;


surf(X,Y,Z); shading flat % 3차원으로 바라보기
xlabel('X');
xlabel('Y');
xlabel('Z');

% 논리오류는 단계별로 확인

% 429호 조교님