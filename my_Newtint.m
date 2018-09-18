function y_int = my_Newtint(x, y, x_int)

N = length(x);
b = zeros(N,N);
b(:,1) = y(:);

for j = 2 : N
    for i = 1: N - j + 1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(j+i-1)-x(i));
    end
end

xt = 1;
y_int = b(1,1);
for k = 1 : N-1
   xt = xt*(x_int-x(k));
   y_int = y_int + b(1,k+1)*xt; 
end

