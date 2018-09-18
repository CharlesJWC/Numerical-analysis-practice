function [eigVal, eigVec, p]= project_Q1_a_b(segnum)

% ******** DESCRIPTION ********
% segment ���� ���� �� ���� ����� �ش��ϴ� ���� ���͵��� 
% MATLAB�� eig�Լ��� ����Ͽ� �����ϴ� �Լ�
% ******** INPUT ********
%  segnum : segment ��
% ******** OUTPUT ********
%  eigVal : ���� �� �밢 ���
%  eigVec : �� �������� ���� ���� ���
%  p      : �� ���� �������� p �� �밢 ���

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2; 
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % �밢 ����
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % �밢 ���� ���� -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % �밢 ���� ������ -1

[eigVec, eigVal] =  eig(A);     % eig �Լ��� ����Ͽ� �������� �������� ����
p = sqrt(diag(eigVal/dx^2));
