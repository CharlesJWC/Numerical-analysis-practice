function xb = incsearch(func, xl, xu, sintv)

x = linspace(xl,xu,sintv);
f = func(x);
N = length(x);

nb = 0; xb = [];
for k = 1 : N-1
    if sign(f(k)) ~=  sign(f(k+1))
       nb = nb + 1;
       xb(nb,1) = x(k);
       xb(nb,2) = x(k+1);
    end
end
