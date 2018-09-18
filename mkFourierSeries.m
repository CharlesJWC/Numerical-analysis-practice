function [func] = mkFourierSeries(x,y,T,n,N)

w0 = 2*pi/T;
Z(:,1) = ones(length(x),1);

for k = 1 : n
   Z(:,2*k) = cos(k*w0*x);
   Z(:,2*k+1) = sin(k*w0*x);
end

a = (Z'*Z)\(Z'*y);

for k = 1:n
   num(k) = k; 
   Ac(k) = a(2*k);
   As(k) = a(2*k+1);
end

y_fs = Z*a;

func = @(t) [1 cos(w0*t) sin(w0*t) cos(2*w0*t) sin(2*w0*t)]*a(1:5,1);

% clf;
% figure;
%subplot(3,1,1);
plot(x,y,'b','linewidth',2); hold on;
%ylim([-2 6.5]);
ylim([min(y)-0.5 max(y)+0.5]);
plot(x,y_fs,'r','linewidth',2); 
hold off;
% title('Furier Series Application');
% legend('Original', 'Furier Series','Location','NorthWest'); 
grid on;
% ax2 = subplot(3,1,2);
% stem(num,Ac,'b');
% xlim(ax2,[0 N+1]);
% ax3 = subplot(3,1,3);
% stem(num,As,'r');
% xlim(ax3,[0 N+1]);
end

