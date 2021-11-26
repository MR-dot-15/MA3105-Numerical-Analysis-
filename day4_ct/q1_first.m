iter = 100; tol = 0.001;
deriv = @(x)(exp(x) - 1);
 
% NR
a = 0.5;
disp("NR Method:");
fprintf("%s \t\t%s \t\t%s \t\t%s \n", ["n", "a", "f(a)", "error_est"]);
fprintf('%d \t%f \t%f \n', [0, a, f1(a)]);
% initiating the array
roots = 1:1:iter+1; error_nr = 1:iter; roots(1) = a;
% iteration --->
for i = 1:iter
    roots(i+1) = roots(i) - f1(roots(i))/deriv(roots(i)); 
    error_nr(i) = roots(i+1) - roots(i);
    fprintf('%d \t%f \t%f \t%f \n', [i, roots(i), f1(roots(i)), roots(i+1) - roots(i)]);
    if abs(roots(i) - roots(i+1)) <= tol
        n1 = i;
        break
    end
end
% secant
a = [0.5 1];
disp("Secant method:");
fprintf('%d \t%f \t%f \n', [0, a(1), f1(a(1))]);
fprintf('%d \t%f \t%f \n', [1, a(2), f1(a(2))]);

% initiation of the array
arr = 1:iter; error_sec = 1:iter
% combining user input a = [a0, a1] with arr
arr = [a, arr];
for i = 1:iter
    % recursive relation
    arr(2+i) = arr(1+i) - f1(arr(i+1))*(arr(i+1) - arr(i))/(f1(arr(i+1)) - f1(arr(i)));
    error_sec(i) = arr(2+i) - arr(1+i);
    fprintf('%d \t%f \t%f \t%f \t \n', [i+1, arr(2+i), f1(arr(2+i)), arr(2+i) - arr(1+i)]);
    % checking error constraint
    if abs(arr(2+i) - arr(1+i)) <= tol
        n2 = i;
        break
    end
end
plot(1:1:n1, error_nr(1:n1));
hold on;
plot(1:1:n2, error_sec(1:n2));
legend('Newton', 'Secant');
xlabel("Iteration"); ylabel("Error estimate");
hold off;
disp("It is evident from the graph that Newton's method converged faster, taking 10 iterations, whereas Secant took 14");
