function y_vec = euler(x0, y0, x_h, h, func)
x_vec = x0:h:x_h;
y_vec = 1:length(x_vec); y_vec(1) = y0;

for i = 2:length(x_vec)
    y_vec(i) = y_vec(i-1) + h*feval(func, x_vec(i-1), y_vec(i-1));
end