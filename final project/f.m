function y = f(x)
if (1<=x)&&(x<2)
    y = x^3/12-x^2/4-x/3+3/2;
elseif (2<=x)&&(x<3)
    y = -x^3/12+3*x^2/4-7*x/3+17/6;
elseif x>=3
    y = -x/12+7/12;
end