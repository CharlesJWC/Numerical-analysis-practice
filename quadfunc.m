
clear all



function [r_1, r_2, n] = quadroots(a,b,c)

n = -1;
if abs(a) < 0
    if abs(b) < 0
        if abs(c) < 0
            n = 3; return;
        else
            n = 0; return;
        end
    else
        n = 1; r_1 = -c/b; return;
    end
else
    n = 2; d =   ;;