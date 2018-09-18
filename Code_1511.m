function Code_1511

clc; close all; clear all;
I = [50 80 130 200 250 350 450 550 700];
P = [99 177 202 248 229 219 173 142 72];

con = fminsearch(@FSSR,[50,50],[],I,P);
% Pm= con(1)
% Isat = con(2)

aa = con(1);
bb  = con(2);

X_reg = linspace(50,700,50);

Y_reg = aa.*log(x)+bb;

% Y_reg = (Pm/Isat)*X_reg.*exp(-X_reg/Isat+1);
figure;
plot(I,P,'o',X_reg,Y_reg,'linewidth',2);grid on;
end

% function f = FSSR(a,xm,ym)
% Pm = a(1); Isat = a(2);
% yp = (Pm/Isat)*xm.*exp(-xm/Isat+1);
% f = sum((ym-yp).^2);
% end


function f = FSSR(a,xm,ym)
aa = a(1); bb = a(2);
yp = aa.*log(xm)+bb;
f = sum((ym-yp).^2);
end
