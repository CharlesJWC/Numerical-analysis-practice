function y_int = my3_Newtint(x, y, x_int)

n = length(x);
b = zeros(n,n);
b(:,1) = y(:);
for j = 2 : n
    for i = 1 : n - j +1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end

xt = 1;
y_int = b(1,1);
for k = 1:n-1
   xt = xt*(x_int-x(k));
   y_int = y_int + b(1,k+1)*xt;
end

