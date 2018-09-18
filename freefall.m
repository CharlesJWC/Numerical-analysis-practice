

clear all; close all;

g = 9.81;
cd = 0.25;
m = 68.1;
t_f = 20;

% v(1) = 0; v1(1) = 0;

dt = 1;
dt1 = 0.5;

t_ex = 1:0.1:20;
v_ex = sqrt((g.*m)./cd).* ...
    tanh(sqrt(g.*cd./m).*t_ex);



t =  0:dt:t_f;
t1 = 0:dt1:t_f;

N = length(t);
N1 = length(t1);

v = zeros(1,N);
v1 = zeros(1,N1);

%얘는 v(N-1) 값이 업데이트가 안되서 for문 돌려야함
% v(2:N) = v(1:N-1) + (g-cd./m.*v(1:N-1).^2).*dt;
% v1(2:N1) = v1(1:N1-1) + (g-cd./m.*v1(1:N1-1).^2).*dt1;


% return
for i = 2: length(t)
    v(i) = v(i-1) + (g-cd./m.*v(i-1).^2).*dt; 
end

for i = 2: length(t1)
    v1(i) = v1(i-1) + (g-cd./m.*v1(i-1).^2).*dt1;
end
% 
% px(1) = 0; px(2:length(t)+1) = t;
% px1(1) = 0; px1(2:length(t1)+1) = t1;


px = t;
px1 = t1;


figure
plot(t,v,':m',t1,v1,'--',t_ex,v_ex)
grid on
legend('\delta t = 1','\delta t1 = 0.5', 'exact');
xlabel("time");
ylabel('height');