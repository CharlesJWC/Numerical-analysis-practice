function [x_sol, total_cnt] = Gauss_pivot_tridiag(A, b)

[m, n] = size(A);

if m ~= n
   error('must be square matrix!');
end

if abs(det(A)) < 10^-5
    error('determinent is 0!');
end
cnt = 0;

A_superdiag = [diag(A(:,2:n))',0];
A_diag = diag(A)';
A_subdiag = [0, diag(A(2:n,:))'];

disp(A_superdiag);
disp(A_diag);
disp(A_subdiag);

x = zeros(n,1);
 
for k = 2: n    
    if A_diag(k-1) == 0
        error('tridiagonal matrix wrong!');
    end
    factor = A_subdiag(k)/A_diag(k-1); cnt=cnt+1;  
    disp(factor);
    A_diag(k) = A_diag(k) - factor*A_superdiag(k-1); cnt=cnt+2;
    b(k) = b(k) - factor*b(k-1); cnt=cnt+2;
end


x(n) = b(n)/A_diag(n); cnt=cnt+1;
for i = n-1 : -1 : 1
    x(i) = (b(i) - A_superdiag(i)*x(i+1))/A_diag(i); cnt=cnt+3; 
end

total_cnt = cnt;
x_sol = x;
