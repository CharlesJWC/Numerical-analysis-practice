
function [y, k, err] = sin_N(x, N, tol)

y = sin(0); 
term = 1;

if N==0
    return;
end

for k = 1 : N
    switch mod(k,4)
        case 1  
            term = abs(term .* x./k);
            y= y+term;
            err = abs(term./y);
        case 3 
            term = -abs(term.* x./k);
            y= y+term;
            err = abs(term./y);
        otherwise
            term = term.*x./k;
    end
    
    if err < tol
        break;
    end
end

end