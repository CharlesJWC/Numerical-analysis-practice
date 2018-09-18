function [y] = DFTM(Num,k)


w = exp(-2*pi*1i/Num);
W = ones(Num,Num);
for i = 2:Num
    for j = 2:Num
        W(i,j) = w^((i-1)*(j-1)); 
    end
end
W = W/sqrt(Num);


x = eye(Num);

for iter = 1 : k
    x = W*x;
end

y = x;


close all;    
grid on;

for t = 1 : 10
    w = exp(-2*pi*1i/t);
W = ones(t,t);
for i = 2:t
    for j = 2:t
        W(i,j) = w^((i-1)*(j-1)); 
    end
end
W = W/sqrt(t);
plot(W)
end