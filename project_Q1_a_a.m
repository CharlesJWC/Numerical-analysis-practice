function [eigVal, p]= project_Q1_a_a(segnum)

% ******** DESCRIPTION ********
% segment 수에 따른 각 고유 값들을 MATLAB 함수를 활용해
% Polynomial Method를 사용하여 산출하는 함수
% ******** INPUT ********
%  segnum : segment 수
% ******** OUTPUT ********
%  eigVal : 고유 값 벡터
%  p      : 각 고유 값에서의 p값 벡터

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2; 
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % 대각 성분
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % 대각 성분 왼쪽 -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % 대각 성분 오른쪽 -1

eigVal =  roots(poly(A));     % polynomial method를 적용하여 고유값 산출
p = sqrt(eigVal/dx^2);