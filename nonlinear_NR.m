function [x,err, i] =  nonlinear_NR (x_init, lamda_in, tol, N)

n = length(x_init);
x = x_init;

if lamda_in >=0 && lamda_in <=2
    lamda = lamda_in;
else
    lamda = 1;
end

for i = 1 : N
    pre_x = x;

    [J, f] = jfunc(x);
    dx = J\f;
    x = x - dx;
    
    x = lamda*x+(1-lamda)*pre_x;
    
    err = 100 * abs(dx./x);    
    
    if all(err < tol)
        break;
    end
end


function [J, f] = jfunc(x)
delta = 0.000001;
df1dx1 = (u(1,x(1)+delta*x(1),x(2))-u(1,x(1),x(2)))/(delta*x(1));
df1dx2 = (u(1,x(1),delta*x(2)+x(2))-u(1,x(1),x(2)))/(delta*x(2));
df2dx1 = (u(2,x(1)+delta*x(1),x(2))-u(2,x(1),x(2)))/(delta*x(1));
df2dx2 = (u(2,x(1),delta*x(2)+x(2))-u(2,x(1),x(2)))/(delta*x(2));

J = [df1dx1 df1dx2; df2dx1 df2dx2];
f1 = u(1,x(1),x(2));
f2 = u(2,x(1),x(2));
f = [f1; f2];

function f = u(num, x, y)

if num == 1
       %f = x^2+x*y-10;
       f = x^2+y-x-0.5; 
elseif num == 2
       %f = y+3*x*y^2-57;
       f = y+5*x*y-x^2;
else
    f = 0;
end