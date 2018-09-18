clc,clf,clear;
t = 1:100;
t(1) = 0;
x = 0;
y = 0;
plot(x,y,'o','MarkerFaceColor','r','MarkerSize',8);
axis([0 3 0 0.8])
M(1) = getframe;
dt = 1/10;
for j = 2:100
    
    t(j) = t(j-1)+dt;
    x = cos(3.12)*t(j);
    y = sin(3.12)*t(j);
    plot(x,y,'o','MarkerFaceColor','r','MarkerSize',8);
    axis([0 3 0 0.8])
    M(j) = getframe;
    if y<=0,break,end
end
pause
movie(M,1)