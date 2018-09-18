function [eigVal,  eigVec, err ,iter]= project_Q2_PowerMethod(Num, tol, eN)
%execVal,
% ******** DESCRIPTION ********
%  DFT Matrix�� ũ�� N�� ����
% �ִ� ���� ���� �ش��ϴ� �������͸� �����ϴ� �Լ�
% ******** INPUT ********
%  Num   :  ��
%  tol   : ������ ����
%  eN    : �ִ� ���� Ƚ��
% ******** OUTPUT ********
%  eigVal : �ִ� ���� ��
%  eigVal : �ִ� ���� ���� �ش��ϴ� ���� ���� (Dominant eigenvector)
%  err    : Power Method ���� �� ������
%  iter   : Power Method ���� Ƚ��

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
% �������� �ʱ�ȭ ����
%eigVec = [ones(Num-1,1); 0] + [1i*ones(Num-1,1); 0i];  % ��Ҹ� 1�� 0���� �ʱ�ȭ
eigVec = ((2*rand(Num,1)-1)+ (2i*rand(Num,1)-1i));                   % ��Ҹ� �������� �ʱ�ȭ
%eigVec = -1i*ones(Num,1);
eigVec = eigVec/norm(eigVec);

eigVec = [1i*ones(Num-3,1); -1; -1i; 1];
eigVec = eigVec/norm(eigVec);
eigVal = 0;                 % �ִ� ������ �ʱ�ȭ

for iter = 1 : eN
    pre_eigVal = eigVal;                 % ���� ���� �� ���
    pre_eigVec = eigVec;
    pre_diff = diff;
    
    Y = W*eigVec;                   % ��İ� ����     
    [big_n, big_r] = max(Y);
    eigVal = Y(big_r);               % ���� �� ����
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
execVal = max(eig(W)); % ��Ȯ�� �׽�Ʈ�� (������ �� ���� ��)

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

%eigVal = norm(max(eig(W))); % ��Ȯ�� �׽�Ʈ�� (������ �� ���� ��)
%[vec, val] = eig(W);
%[big, rr] = max(val);
%eigVec = vec(rr);

end