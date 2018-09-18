clear all; %모든 변수들 다 삭제
close all; %모든 그림창 다 닫음
clc; %커맨드 윈도우 삭제


%figure 창 조절

t = [0:0.1:3];
t2 = [0:0.05:3];

y = sin(2*pi*t2); % 각 주파수가 1인 함수
y2 = cos(2*pi*t2);
y3 = y + y2;
figure; % 그래프창 띄움

plot(t,y,'--','linewidth',2); %사인 그래프 출력
hold on
plot(t2,y,'k', ,'linewidth',2); %사인 그래프 출력 ':'
hold on; % 이전 그래프 그대로 잡고 있음
plot(t2,y2); %사인 그래프 출력

legend('sint(t)', 'cos(t)'); 
xlabel('Time [sec]');
ylabel('Amplitude [V]');


%그래프창에서 그래프 복사 바로 가능
Line color
'k' = black


grid on;    %그래프에 격자 생성



