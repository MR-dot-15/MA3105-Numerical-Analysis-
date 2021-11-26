function out = linear_spline(x, y, x_mesh)
m = length(x_mesh); a = x_mesh(1);
out = 1:m;
% counter = 1,...,n
k = 1;
for i=1:m
    x_l = x(k); x_n = x(k + 1);
    xx = x_mesh(i);
    out(i) = y(k+1)*(xx-x_l)/(x_n-x_l) + y(k)*(x_n-xx)/(x_n-x_l);
    % if x value > right limit of [x_k, x_k+1]
    % counter += 1
    if i == m
        break
    elseif x_mesh(i+1)>x_n
        k = k+1;
    end
end