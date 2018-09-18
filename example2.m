clear all; close all; clc; 

%% 1st example

% 행렬의 차원을 맞춰 주어야 워크스페이스 참고할 것
A = [1 2 3; 4 5 6; 7 8 9];
B1 = [1; 2; 3;];
B2 = [1 2 3]'; % 어퍼 트랜스포스
C = A * B1;

%% 
A = [1 2 3; 4 5 6; 7 8 9];
D = A*A;
E = A.*A;

% 조건문 for문 알고리즘 속도 느림 가급적 .연산 사용
for ii = 1 : 3 % 1부터 3까지
   x(ii) = B2(ii) * B2(ii) 
end

for ii = 1 : 3 % 1부터 3까지
   for jj = 1:3
   F(ii,jj) = A(ii,jj)^2;
   end
    x(ii) = B2(ii) * B2(ii) 
end

y = B2 .* B2;
z = B2.^2
% 모두 결과 동일

%%
t = [0,0.01,10];
[y,y2] = Calculate_Sin_Cos(t);

figure;
hold on; plot(t,y,'-');
hold on; plot(t,y2,'--');
grid on;
xlabel('[sec]'); xlabel('[V]');

%함수실행 스크립랑 같이 선언되거나 경로 추가해주어야함

%%

syms x; % 인자 x를 하나 마늠
u = solve(x^2-3*x+2 ==0,x); % 같다는 ==로 
disp(y);
