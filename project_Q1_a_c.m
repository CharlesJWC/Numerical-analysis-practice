function [eigVal, eigVec, p, err ,iter]= project_Q1_a_c(segnum, tol, eN)

% ******** DESCRIPTION ********
% segment 수에 따른 최대 고유 값과 해당하는 고유 벡터를
% Power Method를 사용하여 산출하는 함수
% ******** INPUT ********
%  segnum : segment 수
%  tol   : 허용오차 조건
%  eN    : 최대 수행 횟수
% ******** OUTPUT ********
%  eigVal : 최대 고유 값
%  eigVal : 최대 고유 값에 해당하는 고유 벡터 (Dominant eigenvector)
%  err    : Power Method 고유 값 오차율
%  iter   : Power Method 수행 횟수

E = 10*10^9;    % Pa
I = 1.25*10^-5; % m^4
L = 3;          % m
dx = L/segnum;

A_diag =  2;
node_num = segnum - 1;
A = diag(A_diag*ones(1,node_num)) + ... % 대각 성분
[zeros(1,node_num);[diag(-1*ones(1,node_num-1)) zeros(node_num-1,1)]] + ... % 대각 성분 왼쪽 -1
[[zeros(node_num-1,1) diag(-1*ones(1,node_num-1))]; zeros(1,node_num)];     % 대각 성분 오른쪽 -1

% 초기화 과정
eigVec = ones(node_num,1);  % Dominant 고유 벡터 요소를 1로 초기화 (각 노드의 초기 y 위치)
%eigVec = rand(node_num,1);  % Dominant 고유 벡터 요소를 랜덤으로 초기화
%eigVec = [ones(node_num-1,1); 0];  % Dominant 고유 벡터 요소를 1과 0으로 초기화
eigVal = 0;                 % 최대 고유값 초기화

for iter = 1 : eN
    pre_eigVal = eigVal;                % 이전 고유 값 기억
    
    eigVec = A*eigVec;                  % 행렬곱 수행
    [big_n, big_r] = max(abs(eigVec));  % 가장 큰 값을 가진 행의 위치 추출 
                                        % (크기가 가장 큰 고유 값이 음수인 경우를 고려)
    eigVal = eigVec(big_r);             % 고유 값 추출
    eigVec = eigVec./eigVal;            % 고유 벡터 정규화
    
    err = 100*abs((eigVal-pre_eigVal)/eigVal);
    if err < tol
       break; 
    end    
end
%eigVal = eigVal/dx^2;

p = sqrt(diag(eigVal/dx^2));


%eigVal = max(eig(A)); % 정확한 테스트용 (제출할 때 지울 것)