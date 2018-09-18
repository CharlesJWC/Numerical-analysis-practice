function x = gaussN(A,b)

[m,n] = size(A);

if m~=n
   error('SQURE NEED'); 
end

nb = n+1;
Aug = [A b];

for k = 1 : n-1
   [big, br] = max(abs(Aug(k:n,k)));
   npw = br + k -1;
   if npw ~= k
      Aug([k,npw],:) =  Aug([npw,k],:);
   end    
    for i = k + 1 : n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:nb) = Aug(i,k:nb) - factor*Aug(k,k:nb);
    end
end

x = zeros(n,1);
x(n) = Aug(n,nb)/Aug(n,n);
for i = n-1 : -1 :1
   x(i) = (Aug(i,nb) - Aug(i,i+1:n)*x(i+1:n))/Aug(i,i); 
end
