function [] = kick_out(x,y,N_st,N_end,delay_t)
close all;
figure('units','normalized','outerposition',[0 0 0.5 1]);
pause(0.5);

for II = N_st : N_end
    pause(1/(II)); %delay_t
    mkFourierSeries(x,y,4,II,N_end) ;
end
end


%x1 = linspace(-3,5,400)'; y1 = (1./((x1-.3).^2+0.01)-1./((x1+.5).^2+0.04))-3;
%x1 = linspace(-1,3,400)'; y1 = (x1.^2-3).*sin(x1.^2)+1;
%x2 = linspace(-3,3,600)'; y2 = pulsefunc(x2);