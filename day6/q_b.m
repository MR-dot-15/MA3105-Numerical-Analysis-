function q_b()
x = [0 1 3 4 7]; y = [1 3 49 129 813];
x_val1 = []; y_val1 = [];
for i = 1:4
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

x_val2 = []; y_val2 = [];
for i = 1:2:3
    x_temp = x(i:i+2); y_temp = y(i:i+2);
    x_r = x_temp(1):0.1:x_temp(end);
    y_r = 1:length(x_r);
    for j = 1:length(x_r)
        y_r(j) = lag_interpol(x_temp, y_temp, x_r(j));
    end
    x_val2 = [x_val2 x_r]; y_val2 = [y_val2 y_r];
end

plot(x_val1, y_val1); hold on;
plot(x_val2, y_val2);
scatter(x, y, 'filled'); legend('P1(x)', 'P2(x)', 'data', 'Location', 'southwest');
xlim([-0.5 7.5]); ylim([0 820]); grid on;
hold off;