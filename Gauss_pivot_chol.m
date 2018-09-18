function [x_sol,L,U, total_cnt] = Gauss_pivot_chol(A, b)

[m, n] = size(A);
[bm, bn] = size(b);
if m ~= n || m ~= bm
   error('must be square matrix!');
end
if ~isequal(A',A)
   error('must be symetric matrix!');
end

U = zeros(n,n);
cnt = 0;

for i = 1:n
    for j = i: n    
        if i == j
           U(i,j) = sqrt( A(i,j) - U(1:i-1,i)'*U(1:i-1,j) );
        else
           U(i,j) = ( A(i,j) -  U(1:i-1,i)'*U(1:i-1,j) ) / U(i,i);
        end
    end
end

L = U';

%d= L\b;
%x=U\d;

% 대각선 1로 표준화
% for k = 1: n
%    L(k,:) = L(k,:)/L(k,k);
% end

disp(b);
% forward substitution
d = zeros(n,bn);
for k = 1 : bn 
    for i = 1 : n
        d(i,k) = b(i,k) - L(i,1:i-1)*d(1:i-1, k);  
    end
end
disp(d);

% backward substitution
x = zeros(n,bn);
for k = 1 : bn 
    for i = n : -1 : 1
        x(i,k) = (d(i,k) - U(i,i+1:n)*x(i+1:n,k))/U(i,i); 
    end
end

total_cnt = cnt;
x_sol = x;
