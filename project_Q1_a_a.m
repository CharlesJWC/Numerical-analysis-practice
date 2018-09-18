function [eigVal, p]= project_Q1_a_a(segnum)

% ******** DESCRIPTION ********
% segment ���� ���� �� ���� ������ MATLAB �Լ��� Ȱ����
% Polynomial Method�� ����Ͽ� �����ϴ� �Լ�
% ******** INPUT ********
%  segnum : segment ��
% ******** OUTPUT ********
%  eigVal : ���� �� ����
%  p      : �� ���� �������� p�� ����

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2; 
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % �밢 ����
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % �밢 ���� ���� -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % �밢 ���� ������ -1

eigVal =  roots(poly(A));     % polynomial method�� �����Ͽ� ������ ����
p = sqrt(eigVal/dx^2);