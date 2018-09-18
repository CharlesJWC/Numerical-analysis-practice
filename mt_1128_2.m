close all;

x = -1:0.01:1;
y = 1./(1+25.*x.^2);

x1 = -1:0.25:1;
y1 = 1./(1+25.*x1.^2);

figure
grid on; hold on;
plot(x,y)
plot(x1,y1,'-o')


% OFDM (wide_band)이 피팅
% 차수가 높아지면 정확도는 어느정도 높아지지만 진동이 심해짐

% SubDomain
% 구간 작아지면 Low 차수도 잘 맞고
% 차수 낮추면 진동도 낮아지고
% 이걸 스플라인(Spline), 불확실성 
% 미분 불가능한 지점이 생김

% 2d 연산량