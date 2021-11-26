function q_a()
x = [0 1 3]; y = [1 3 5];
x_val = 0:0.1:3; y_val = 1:length(x_val);
for i = 1:length(x_val)
    y_val(i) = lag_interpol(x, y, x_val(i));
end
x_val1 = []; y_val1 = [];
for i = 1:2
    x_temp = x(i:i+1); y_temp = y(i:i+1);
    x_r = x_temp(1):0.1:x_temp(end);
    y_r = 1:length(x_r);
    for j = 1:length(x_r)
        y_r(j) = lag_interpol(x_temp, y_temp, x_r(j));
    end
    x_val1 = [x_val1 x_r]; y_val1 = [y_val1 y_r];
end

disp('1-degree approximation');
disp('P_1(x) = (x - x1)y0/(x0 - x1) + (x - x0)y1/(x1- x0)'); 
disp('2-degree approximation');
disp('P_2(x) = y0(x-x1)(x-x2)/(x0-x1)(x0-x2) + y1(x-x0)(x-x2)/(x1-x0)(x1-x2) + y2(x-x0)(x-x2)/(x2-x0)(x2-x1)');
plot(x_val1, y_val1, '.-'); hold on;
plot(x_val, y_val, '+-');
scatter(x, y, 'filled');
xlim([-0.5 3.5]); ylim([0 6]); grid on;
legend('P1(x)', 'P2(x)', 'data', 'Location', 'west');
hold off;