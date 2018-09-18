function [eigVal_set, err_set ,iter_set]= project_Q1_b(seg_s, seg_n, tol, eN)

% ******** DESCRIPTION ********
% segment ���� ��ȭ��Ű�鼭 �ִ� �������� �����ϰ� 
% �� ���踦 plot�ϴ� �Լ�
% ******** INPUT ********
%  seg_s : ���� segment ��
%  seg_n : ���� segment ��
%  tol   : ������ ����
%  eN    : �ִ� ���� Ƚ��
% ******** OUTPUT ********
%  eigVal_set : �� segment�� �ִ� ������
%  err_set    : �� segment�� Power Method ���� �� ������
%  iter_set   : �� segment�� Power Method ���� Ƚ��

test_N = seg_n-seg_s+1;

eigVal_set = zeros(1, test_N);
err_set    = zeros(1, test_N);
iter_set   = zeros(1, test_N);

for k = 1: test_N
    [eigVal_set(k), eigVec_dummy, p_dummy, err_set(k),iter_set(k)] = ...
        project_Q1_a_c(seg_s+k-1, tol, eN);
end

seg_num = seg_s:seg_n;
close all; figure; hold on; grid on;
plot(seg_num, eigVal_set, 'bo');
plot(seg_num, eigVal_set, 'g-');
title('Maximum eigenvalue according to the number of segments','fontsize',16,'FontWeight','bold');
xlabel('The number of segments','fontsize',14,'FontWeight','bold');
ylabel('Maximum eigen value','fontsize',14,'FontWeight','bold');
%xlim([0 25]); %ylim([3 5]);