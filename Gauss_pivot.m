function [x_sol,A_eli, total_cnt] = Gauss_pivot(A, b)

[m n] = size(A);

if m ~= n
   error('must be square matrix!');
end

cnt = 0;

nb = n+1;
Aug_Ab = [A b];
x = zeros(n,1);
 
for j = 1: n-1    
    % 부분 피보팅
    [maxVal_P, n_PR] = max(Aug_Ab(j:n,j));
    n_PR = j + n_PR -1; cnt=cnt+2;                     %fprintf('current Pivot row : %d\t maxVal: %d\n', n_PR,maxVal_P);
    if j ~= n_PR
        Aug_Ab([n_PR,j],:) = Aug_Ab([j,n_PR],:); % 동시 교환이 되네
%         temp_R = Aug_Ab(n_PR,:);
%         Aug_Ab(n_PR,:) =  Aug_Ab(j,:);
%         Aug_Ab(j,:) = temp_R;               %fprintf('%d행이랑 %d행이랑 바꿈!\n', j,n_PR); disp(Aug_Ab);
    end
    
    % 가우스 
    for i = j+1 : n
        factor = Aug_Ab(i,j)/maxVal_P; cnt=cnt+1;                      %fprintf('현재 %d행 기준으로 %d행 소거 중\tfactor : %f\n', j,i,factor); disp(Aug_Ab(i,j));       
        Aug_Ab(i,j:nb) = Aug_Ab(i,j:nb) - factor*Aug_Ab(j,j:nb); cnt=cnt+2*(n+1-j+1);     %disp(Aug_Ab);
    end
end

for i = n : -1 : 1
    x(i) = (Aug_Ab(i,nb) - Aug_Ab(i,i+1:n)*x(i+1:n))/Aug_Ab(i,i);  cnt=cnt+1+2*(n-i);
end

total_cnt = cnt;
A_eli = Aug_Ab; 
x_sol = x;
