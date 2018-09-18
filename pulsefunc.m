function y = pulsefunc(x)

n = length(x);

for k = 1 : n
    if mod(abs(ceil(x(k))),2) == 1
        y(k,1) = 1; 
    else
        y(k,1) = 0;
    end
end