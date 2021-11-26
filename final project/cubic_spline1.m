function out = cubic_spline1(x, y, x_mesh, flag, deriv)
if x_mesh(end)>x(end)
    disp("Invalid mesh")
    return
end
h = x(2) - x(1); n = length(x);
f = 1:n; f(1) = 0;
for i = 2:n-1
    f(i) = 3*(y(i+1)-2*y(i)+y(i-1))/h;
end
f(end) = 0;

if flag == 0
    b_diag = [1 4*h*ones(1, n-2) 1];
    a_diag = [h*ones(1, n-2) 0];
    c_diag = [0 h*ones(1, n-2)];
elseif flag == 1
    f(1) = 3*(y(2)-y(1))/h - 3*deriv(1);
    f(end) = 3*deriv(2) - 3*(y(end)-y(end-1))/h;
    b_diag = [2*h 4*h*ones(1, n-2) 2*h];
    a_diag = h*ones(1, n-1);
    c_diag = h*ones(1, n-1);
end

c = thomas(a_diag, b_diag, c_diag, f);

b = 1:n-1; d = 1:n-1;
for i = 1:n-1
    b(i) = (y(i+1)-y(i))/h - ...
        h*(2*c(i)+c(i+1))/3;
    d(i) = (c(i+1)-c(i))/(3*h);
end

k = 1; m = length(x_mesh);
out = 1:m;
for i = 1:m
    xl = x(k); xn = x(k+1); xx = x_mesh(i);
    out(i) = y(k) + b(k)*(xx-xl) +...
        c(k)*(xx-xl)^2 + d(k)*(xx-xl)^3;
    if i == m
        break
    elseif x_mesh(i+1)>xn
        k = k+1;
    end
end