iter = 100; tol = 0.001;
deriv = @(x)(exp(x) - 1);

% functional plot
x_range = -1:0.1:2;
plot(x_range, f1(x_range)); 
xlabel("x"), ylabel("e^x - x -1");

pause

% NR
a = -20:0.5:20;
sol_nr = 1:length(a); iter_nr = 1:length(a);
for j = 1:length(a)
    % initiating the array
    roots = 1:1:iter+1; roots(1) = a(j);
    % iteration --->
    for i = 1:iter
        roots(i+1) = roots(i) - f1(roots(i))/deriv(roots(i)); 
        if abs(roots(i) - roots(i+1)) <= tol
            sol_nr(j) = roots(i+1); iter_nr(j) = i;
            break
        end
    end
end
% secant
sol_sec = 1:length(a); iter_sec = 1:length(a);
for j = 1:length(a)
    x = [a(j), a(j)+0.5];
    % initiation of the array
    arr = 1:iter;
    % combining user input a = [a0, a1] with arr
    arr = [x, arr];
    for i = 1:iter
        % recursive relation
        arr(2+i) = arr(1+i) - f1(arr(i+1))*(arr(i+1) - arr(i))/(f1(arr(i+1)) - f1(arr(i)));
        % checking error constraint
        if abs(arr(2+i) - arr(1+i)) <= tol
            sol_sec(j) = arr(2+i); iter_sec(j) = i;
            break
        end
    end
end
subplot(2,2,1)
plot(a, sol_nr); hold on;
plot(a, sol_sec); legend("Newton Raphson", "Secant"); 
xlabel("Initial val"), ylabel("Root"); hold off;

subplot(2,2,2)
plot(a, iter_nr); hold on;
plot(a, iter_sec); legend("Newton Raphson", "Secant"); 
xlabel("Initial val"), ylabel("No of iterations"); hold off;


disp("Near x = 0, NR fails to find a root.")
disp("At x = 0, the tangent becomes parallel to X axis and never intersects X axis. Thus NR method fails.")

disp("NR is superior to Secant, as it has taken lower no of iterations expect around x = 0");