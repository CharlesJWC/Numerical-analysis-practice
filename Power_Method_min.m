function [eigVal, eigVec, err ,iter] = Power_Method_min(A ,tol, N)

[m, n] = size(A);

if m~=n
   error('must be squre'); 
end

X = ones(n,1);

A=inv(A);

% √ ±‚»≠
eigVec = A*X;
[big_n, big_r] = max(abs(eigVec));
eigVal =  eigVec(big_r);
eigVec = eigVec./eigVal;

for iter = 2 : N
    pre_eigVal = eigVal;
    
    eigVec = A*eigVec;    
    [big_n, big_r] = max(abs(eigVec));
    eigVal =  eigVec(big_r);
    eigVec = eigVec./eigVal;
    
    err = 100*abs((eigVal-pre_eigVal)/eigVal);
    if err < tol
       break; 
    end
    
end

eigVal = 1/eigVal;
