function [a] = my_linregG(Z,y)

a = (Z'*Z)\(Z'*y);
Sr = sum((y-Z*a).^2);
St = sum((y-mean(y)).^2);
r2 = 1- Sr/St;
syx = sqrt(Sr/(length(y) - length(a)));

end