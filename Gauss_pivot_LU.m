function [x_sol,L,U, total_cnt] = Gauss_pivot_LU(A, b)

[m, n] = size(A);
[bm, bn] = size(b);
if m ~= n || m ~= bm
   error('must be square matrix!');
end

cnt = 0;

L = eye(n);
P = eye(n);

for j = 1: n-1    
    % 부분 피보팅
    [maxVal_P, n_PR] = max(A(j:n,j));
    n_PR = j + n_PR -1; cnt=cnt+2;                     %fprintf('current Pivot row : %d\t maxVal: %d\n', n_PR,maxVal_P);
    if j ~= n_PR
        A([n_PR,j],:) = A([j,n_PR],:); % 동시 교환이 되네
        P([n_PR,j],:) = P([j,n_PR],:);
        if j ~= 1
            L([n_PR,j],j) = L([j,n_PR],j);
        end
        disp(L);
    end
    
    % 가우스 
    for i = j+1 : n
        factor = A(i,j)/maxVal_P; cnt=cnt+1;                      %fprintf('현재 %d행 기준으로 %d행 소거 중\tfactor : %f\n', j,i,factor); disp(Aug_Ab(i,j));       
        A(i,j:n) = A(i,j:n) - factor*A(j,j:n); cnt=cnt+2*(n+1-j+1);     %disp(Aug_Ab);
        L(i,j) = factor;
    end
end
U = A;


% forward substitution
d = zeros(n,bn);
b = P*b;

for k = 1 : bn 
    for i = 1 : n
        d(i,k) = b(i,k) - L(i,1:i-1)*d(1:i-1, k);  cnt=cnt+1+2*(n-i);
    end
end

% backward substitution
x = zeros(n,bn);
for k = 1 : bn 
    for i = n : -1 : 1
        x(i,k) = (d(i,k) - U(i,i+1:n)*x(i+1:n,k))/U(i,i);  cnt=cnt+1+2*(n-i);
    end
end

total_cnt = cnt;
x_sol = x;
