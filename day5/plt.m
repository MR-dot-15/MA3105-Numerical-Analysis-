function plt()
range = 0:0.01:10; init = 0.5;iter = 100; tol = 0.001;
subplot(1, 3, 1)
plot(range, f1(range), color = 'blue'); grid on; hold on;
plot(range, range, color = 'black');
x_array = fp_iter(init, iter, tol, 1);
for i = 1:length(x_array)-1
    plot([x_array(i), f1(x_array(i))], [f1(x_array(i)), f1(x_array(i))], color = 'red')
    plot([f1(x_array(i)), x_array(i+1)], [f1(x_array(i)), f1(x_array(i+1))], color = 'red')
end
xlim([-15 5]); ylim([-15 5]);
xlabel('x'), ylabel('f1(x)'); hold off;

subplot(1, 3, 2)
plot(range, f2(range), color = 'blue'); grid on; hold on;
plot(range, range, color = 'black');
x_array = fp_iter(init, iter, tol, 2);
for i = 1:length(x_array)-1
    plot([x_array(i), f2(x_array(i))], [f2(x_array(i)), f2(x_array(i))], color = 'red')
    plot([f2(x_array(i)), x_array(i+1)], [f2(x_array(i)), f2(x_array(i+1))], color = 'red')
end
xlim([0 4]); ylim([1.7 1.9]);
xlabel('x'), ylabel('f2(x)'); hold off;

subplot(1, 3, 3)
plot(range, f3(range), color = 'blue'); grid on; hold on;
plot(range, range, color = 'black');
x_array = fp_iter(init, iter, tol, 3);
for i = 1:length(x_array)-1
    plot([x_array(i), f3(x_array(i))], [f3(x_array(i)), f3(x_array(i))], color = 'red')
    plot([f3(x_array(i)), x_array(i+1)], [f3(x_array(i)), f3(x_array(i+1))], color = 'red')
end
xlim([0 10]); ylim([0 10]);
xlabel('x'), ylabel('f3(x)');
hold off;