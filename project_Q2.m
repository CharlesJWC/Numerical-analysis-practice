function [eigVal_set, err_set ,iter_set]= project_Q2(Num_s, Num_n, tol, eN)

% ******** DESCRIPTION ********
% DFT Matrix의 크기 N을 변화시키면서 
% 최대 고유값을 산출하고 그 관계를 plot하는 함수
% ******** INPUT ********
%  Num_s : 시작 N의 값
%  Num_n : 종료 N의 값
%  tol   : 허용오차 조건
%  eN    : 최대 수행 횟수
% ******** OUTPUT ********
%  eigVal_set : 각 segment의 최대 고유값
%  err_set    : 각 segment의 Power Method 고유 값 오차율
%  iter_set   : 각 segment의 Power Method 수행 횟수

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
