function [eigVal, eigVec, p, err ,iter]= project_Q1_a_c(segnum, tol, eN)

% ******** DESCRIPTION ********
% segment ���� ���� �ִ� ���� ���� �ش��ϴ� ���� ���͸�
% Power Method�� ����Ͽ� �����ϴ� �Լ�
% ******** INPUT ********
%  segnum : segment ��
%  tol   : ������ ����
%  eN    : �ִ� ���� Ƚ��
% ******** OUTPUT ********
%  eigVal : �ִ� ���� ��
%  eigVal : �ִ� ���� ���� �ش��ϴ� ���� ���� (Dominant eigenvector)
%  err    : Power Method ���� �� ������
%  iter   : Power Method ���� Ƚ��

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2;
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % �밢 ����
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % �밢 ���� ���� -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % �밢 ���� ������ -1

% �ʱ�ȭ ����
eigVec = ones(node_num,1);  % Dominant ���� ���� ��Ҹ� 1�� �ʱ�ȭ (�� ����� �ʱ� y ��ġ)
%eigVec = rand(node_num,1);  % Dominant ���� ���� ��Ҹ� �������� �ʱ�ȭ
%eigVec = [ones(node_num-1,1); 0];  % Dominant ���� ���� ��Ҹ� 1�� 0���� �ʱ�ȭ
eigVal = 0;                 % �ִ� ������ �ʱ�ȭ

for iter = 1 : eN
    pre_eigVal = eigVal;                % ���� ���� �� ���
    
    eigVec = A*eigVec;                  % ��İ� ����
    [big_n, big_r] = max(abs(eigVec));  % ���� ū ���� ���� ���� ��ġ ���� 
                                        % (ũ�Ⱑ ���� ū ���� ���� ������ ��츦 ���)
    eigVal = eigVec(big_r);             % ���� �� ����
    eigVec = eigVec./eigVal;            % ���� ���� ����ȭ
    
    err = 100*abs((eigVal-pre_eigVal)/eigVal);
    if err < tol
       break; 
    end    
end
%eigVal = eigVal/dx^2;

p = sqrt(diag(eigVal/dx^2));


%eigVal = max(eig(A)); % ��Ȯ�� �׽�Ʈ�� (������ �� ���� ��)