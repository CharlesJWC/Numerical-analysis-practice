function [eigVal_set, err_set ,iter_set]= project_Q1_b(seg_s, seg_n, tol, eN)

% ******** DESCRIPTION ********
% segment 수를 변화시키면서 최대 고유값을 산출하고 
% 그 관계를 plot하는 함수
% ******** INPUT ********
%  seg_s : 시작 segment 수
%  seg_n : 종료 segment 수
%  tol   : 허용오차 조건
%  eN    : 최대 수행 횟수
% ******** OUTPUT ********
%  eigVal_set : 각 segment의 최대 고유값
%  err_set    : 각 segment의 Power Method 고유 값 오차율
%  iter_set   : 각 segment의 Power Method 수행 횟수

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