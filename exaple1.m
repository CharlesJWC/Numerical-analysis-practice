clear all; %��� ������ �� ����
close all; %��� �׸�â �� ����
clc; %Ŀ�ǵ� ������ ����


%figure â ����

t = [0:0.1:3];
t2 = [0:0.05:3];

y = sin(2*pi*t2); % �� ���ļ��� 1�� �Լ�
y2 = cos(2*pi*t2);
y3 = y + y2;
figure; % �׷���â ���

plot(t,y,'--','linewidth',2); %���� �׷��� ���
hold on
plot(t2,y,'k', ,'linewidth',2); %���� �׷��� ��� ':'
hold on; % ���� �׷��� �״�� ��� ����
plot(t2,y2); %���� �׷��� ���

legend('sint(t)', 'cos(t)'); 
xlabel('Time [sec]');
ylabel('Amplitude [V]');


%�׷���â���� �׷��� ���� �ٷ� ����
Line color
'k' = black


grid on;    %�׷����� ���� ����



