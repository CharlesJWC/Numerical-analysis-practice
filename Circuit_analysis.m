clear all; close all; clc;

%%%% & : AND
%%%% | : OR

dt = 1e-5; %100분의 1
t = [0:dt:20e-3];
N = length(t);
vs = 25*ones(size(t));

index1_ = find(t > 4e-3 & t < 8e-3);
index2_ = find(t > 12e-3 & t < 16e-3);

vs(index1_) = 0;
vs(index2_) = 0;

figure;

% hold on; plot(t,vs, 'linewidth', 2); % 질문 figure 안하고 바로 plot 하면 알아서 figure명령을 실행시키는 건지 ? 그렇긴한데 여러개 띄울땐 필요함
% grid on;
xlabel('t [sec]'); ylabel('V');


%%

% Size 1, 2001 반환
% length 2001 반환
for k = 1: 5 : 100

R = 100; % 옴
C = 2e-6; % 패럿
L = k * 1e-3; % 헨리

I_(1) = 0;
I_(2) = 0;
Ip_(1) = 0;



for mm = 3 : N
    Ip_(mm-2) = (I_(mm-1) - I_(mm-2))/dt;
    f_ = 1/(R*L*C)*vs(mm-2) - 1/(C*L)*I_(mm-2) - 1/(R*C)*Ip_(mm-2);
    I_(mm) = 2*I_(mm-1) - I_(mm-2) + (dt)^2*f_;
    drawnow()
end


% figure; 
% hold on; 
plot(t,I_,'r', 'linewidth', 2); grid on;
xlim([0 20e-3]); ylim([-0.3 0.6]);
% legend('C = ', C); %, 'L = ', L, 'R = ', 100); 
% xlabel('t [sec]'); ylabel('V');

% for l = 1 : 200
% end

end