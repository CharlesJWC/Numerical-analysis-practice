function [eigVal, eigVec, p]= project_Q1_a_b(segnum)

% ******** DESCRIPTION ********
% segment 수에 따른 각 고유 값들과 해당하는 고유 벡터들을 
% MATLAB의 eig함수를 사용하여 산출하는 함수
% ******** INPUT ********
%  segnum : segment 수
% ******** OUTPUT ********
%  eigVal : 고유 값 대각 행렬
%  eigVec : 각 고유값의 고유 벡터 행렬
%  p      : 각 고유 값에서의 p 값 대각 행렬

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2; 
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % 대각 성분
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % 대각 성분 왼쪽 -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % 대각 성분 오른쪽 -1

[eigVec, eigVal] =  eig(A);     % eig 함수를 사용하여 고유값과 고유벡터 추출
p = sqrt(diag(eigVal/dx^2));
