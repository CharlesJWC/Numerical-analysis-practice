function y = trifunc(x)

n = length(x);

for k = 1 : n
        y(k,1) =  x(k) - floor(x(k)); 
end