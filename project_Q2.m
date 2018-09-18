function [eigVal_set, err_set ,iter_set]= project_Q2(Num_s, Num_n, tol, eN)

% ******** DESCRIPTION ********
% DFT Matrix�� ũ�� N�� ��ȭ��Ű�鼭 
% �ִ� �������� �����ϰ� �� ���踦 plot�ϴ� �Լ�
% ******** INPUT ********
%  Num_s : ���� N�� ��
%  Num_n : ���� N�� ��
%  tol   : ������ ����
%  eN    : �ִ� ���� Ƚ��
% ******** OUTPUT ********
%  eigVal_set : �� segment�� �ִ� ������
%  err_set    : �� segment�� Power Method ���� �� ������
%  iter_set   : �� segment�� Power Method ���� Ƚ��

test_N = Num_n-Num_s+1;

eigVal_set = zeros(1, test_N);
err_set    = zeros(1, test_N);
iter_set   = zeros(1, test_N);

for k = 1: test_N
    [eigVal_set(k), eigVec_dummy, err_set(k),iter_set(k)] = ...
        project_Q2_PowerMethod(Num_s+k-1, tol, eN);
end

Num_seq = Num_s:Num_n;
close all; figure; hold on; grid on;
 plot(Num_seq, eigVal_set, 'bo');
 plot(Num_seq, eigVal_set, 'g-');
title('Maximum eigenvalue according to N','fontsize',16,'FontWeight','bold');
xlabel('N ','fontsize',16,'FontWeight','bold');
ylabel('Maximum eigen value','fontsize',14,'FontWeight','bold');
%ylim([0 5]);

 figure; grid on; hold on;
 plot(eigVal_set, 'bo');
 plot(eigVal_set, 'g-');

end
