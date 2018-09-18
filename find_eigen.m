clear all;

function [evec, eval, k, err] = find_eigen(A, x0, N, es)

% if m != n
%if N==0 



for k = 1 : N

    px = x;    
    plm = lm;
    
    if k == 1
        x = A*x0;
        x = x/max(x); 
    else 
       x = A*px;
       x = x/max(x); 
       lm = ((A*x)*x')/(x*x');
    end
    err = norm(x-px)/norm(x);
    if  err < es %&& (lm-plm)/lm < es
        break;
    end
end

evec = x;
eval = lm;

end