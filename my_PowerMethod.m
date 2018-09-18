function [eigVal, eigVec, err, iter] = my_PowerMethod(A, tol, N)

[m,n]=size(A);

eigVec = ones(n,1);

eigVec = A*eigVec;
[big, big_r] = max(abs(eigVec));
eigVal = eigVec(big_r);
eigVec = eigVec/eigVal;

for iter = 1:N
   pre_eigVal = eigVal;
   
    eigVec = A*eigVec;
    [big, big_r] = max(abs(eigVec));
    eigVal = eigVec(big_r);
    eigVec = eigVec/eigVal;

    err = 100*abs((eigVal- pre_eigVal)/eigVal);
    
    if err < tol
        break;
    end
end



