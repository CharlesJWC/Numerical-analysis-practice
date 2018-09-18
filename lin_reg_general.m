function [a, y_out] = lin_reg_general(Z,Y)

a = (Z'*Z)\(Z'*Y);

Sr = sum((Y-Z*a).^2)
r2 = 1-Sr/sum((Y-mean(Y)).^2)


y_out = Z*a;

%plot(X,Y,'--',X,y,'r');
end

