function [eigVal,  eigVec, err ,iter]= project_Q2_PowerMethod(Num, tol, eN)
%execVal,
% ******** DESCRIPTION ********
%  DFT Matrix의 크기 N에 따른
% 최대 고유 값과 해당하는 고유벡터를 산출하는 함수
% ******** INPUT ********
%  Num   :  수
%  tol   : 허용오차 조건
%  eN    : 최대 수행 횟수
% ******** OUTPUT ********
%  eigVal : 최대 고유 값
%  eigVal : 최대 고유 값에 해당하는 고유 벡터 (Dominant eigenvector)
%  err    : Power Method 고유 값 오차율
%  iter   : Power Method 수행 횟수

w = exp(-2*pi*1i/Num);

W = ones(Num,Num);
for i = 2:Num
    for j = 2:Num
        W(i,j) = w^((i-1)*(j-1)); 
    end
end
W = W/Num;
diff = 0;

eigChange = [];
diff_change = [];
err_change = [];
eignorm= [];
% 고유벡터 초기화 과정
%eigVec = [ones(Num-1,1); 0] + [1i*ones(Num-1,1); 0i];  % 요소를 1과 0으로 초기화
eigVec = ((2*rand(Num,1)-1)+ (2i*rand(Num,1)-1i));                   % 요소를 랜덤으로 초기화
%eigVec = -1i*ones(Num,1);
eigVec = eigVec/norm(eigVec);

eigVec = [1i*ones(Num-3,1); -1; -1i; 1];
eigVec = eigVec/norm(eigVec);
eigVal = 0;                 % 최대 고유값 초기화

for iter = 1 : eN
    pre_eigVal = eigVal;                 % 이전 고유 값 기억
    pre_eigVec = eigVec;
    pre_diff = diff;
    
    Y = W*eigVec;                   % 행렬곱 수행     
    [big_n, big_r] = max(Y);
    eigVal = Y(big_r);               % 고유 값 추출
    eignorm = [eignorm norm(eigVal)];
    eigChange = [eigChange eigVal];
    %eigVal = norm(eigVec,inf)/norm(pre_eigVec,inf);
    
    eigVec = Y/norm(Y);
    
%     err_R = 100*abs(norm(real(eigVec)-real(pre_eigVec))/norm(real(eigVec)));
%     err_I = 100*abs(norm(imag(eigVec)-imag(pre_eigVec))/norm(imag(eigVec)));
%     
    diff = abs((norm(eigVal)-norm(pre_eigVal)));
    diff_change(end+1) = diff;
     err = 100*abs((diff-pre_diff)/diff);
     
     err_change(end+1) = err;
     
     if err < tol 
     %  break; 
    end    
end
%eigVal = norm(eigVal);
eigVal = eigVal/Num;
eigVal = (max(eig(W)));
execVal = max(eig(W)); % 정확한 테스트용 (제출할 때 지울 것)

close all;
figure; grid on; hold on;
eig_num = 1:length(eigChange);
plot(eig_num,eignorm,'bo');
plot(eig_num,eignorm,'g');


figure; grid on; hold on;
plot(eig_num,eigChange,'o');
plot(eig_num,eigChange,'p');


figure; grid on; hold on;
plot(err_change,'r');

figure; grid on; hold on;
plot(diff_change,'b');

% plot(eig_num,imag(eigChange),'bo');
% plot(eig_num,imag(eigChange),'g');

%eigVal = norm(max(eig(W))); % 정확한 테스트용 (제출할 때 지울 것)
%[vec, val] = eig(W);
%[big, rr] = max(val);
%eigVec = vec(rr);

end