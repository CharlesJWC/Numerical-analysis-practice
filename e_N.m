

function [y,k,err] = e_N(x,N,tol)

y= 1;
term =1;

if N == 0
    return;
end

for k = 1:N
    term = term.*x./k;
    y=y+term;
    
    err = abs(term./y);
    
    if err < tol
        break;
    end
end


end
   