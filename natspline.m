function [yy,dy,d2] = natspline(x,y,xx)

N = length(x);
M = length(xx);
b = zeros(N,N);

aa(1,1) = 1; aa(N,N) =1;
bb(1) = 0; bb(N) = 0;

for i = 2 :N-1
    aa(i,i-1) = h(x, i-1);
    aa(i,i) = 2*(h(x,i-1) + h(x, i));
    aa(i,i+1) = h(x,i);
    bb(i) = 3 * (fd(i+1,i,x,y)-fd(i,i-1,x,y));
end
    
c = aa\bb;

for i = 1:N-1
   a(i) = y(i); 
   b(i) = fd(i+1,i,x,y) - h(x,y)/3*(2*c(i) + c(i+1));
   d(i) = (c(i+1)-c(i))/3/h(x,i);
end
    
for i = 1:M
    [yy(i), dy(i), d2(i)] = SplineInterp(x,n,a,b,c,d,xx(i));
end
end

function hh = h(x,i)
    hh = x(i+1)-x(i);
end

function fdd = fd(i, j, x, y)
    fdd = (y(i) - y(j))/ (x(i)-x(j));
end

function [yyy,dyy,d2y] = SplineInterp(x,n,a,b,c,d,xi)
for ii = 1 : n-1
    if xi >= x(ii) - 0.000001 & xi < x(ii +1) + 0.000001
        yyy = a(ii) + b(ii)*(xi-x(ii))+c(ii)*(xi-x(ii))^2+d(ii)*(xi-x(ii))^3;
        dyy = b(ii) + 2*c(ii)*(xi-x(ii))+3*d(ii)*(xi-x(ii))^2;
        d2y = 2*c(ii) + 6*d(ii)*(xi-x(ii));
        break;
    end    
end
end