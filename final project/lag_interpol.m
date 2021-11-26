function est = lag_interpol(x, y, x_val)
est = 0;
for i = 1:length(y)
    temp = 1;
    for j = 1:length(x)
        if i == j
            continue
        end
        temp = temp * (x_val - x(j))/(x(i) - x(j));
    end
    est = est + y(i) * temp;
end