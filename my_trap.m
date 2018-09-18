function I = my_trap(func, a,b,n)

x = a; h = (b-a)/n;
S = func(a);

for k = 1 : n-1
    x = x+h;
   S = S + 2*func(x); 
end

S = S + func(b);

I = h/2*S;