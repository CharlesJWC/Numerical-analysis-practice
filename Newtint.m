function yint = Newtint(x,y,xx)

N = length(x);
b = zeros(N,N);
b(:,1) = y(:);

for k = 2 : N
   for j = 1: N-k+1
       b(j,k) = (b(j+1,k-1)-b(j,k-1))/(x(k+j-1)-x(j));
   end
end

xt = 1;
yint = b(1,1);
for k = 1 : N-1
   xt = xt*(xx-x(k));
   yint = yint+ b(1,k+1)*xt;
end
