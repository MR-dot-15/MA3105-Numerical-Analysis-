a = 0.5; iter = 100; tol = 1e-5;
deriv = @(x)((x - 1.1)^3 + 3*(x-2.1)*(x - 1.1)^2);
fprintf("%s \t\t%s \t\t%s \t\t%s \n", ["n", "a", "f(a)", "error_est"]);
fprintf('%d \t%f \t%f \n', [0, a, f2(a)]);
% initiating the array
roots = 1:1:iter+1; roots(1) = a; error_nr = 1:iter;
% iteration --->
for i = 1:iter
    roots(i+1) = roots(i) - f2(roots(i))/deriv(roots(i)); 
    error_nr(i) = roots(i+1) - roots(i);
    fprintf('%d \t%f \t%f \t%f \n', [i, roots(i), f2(roots(i)), roots(i+1) - roots(i)]);
    if abs(roots(i) - roots(i+1)) <= tol
        n = i;
        break;
    end
end
plot(1:1:n, error_nr(1:n));
legend("Convergence using NR"); xlabel("Iteration"); ylabel("Error estimate");

disp("As observable in the error-iteration graph, the convergence is quadratic in nature");
disp("Clearly, the algorithm converges towards 1.1");
disp("Therefore, accuracy = |(1.1 - 1.09997)|/1.1 = "); disp(abs(1.1 - 1.09997)/1.1);

disp("The most straight-forward way to enhance accuracy is to decrease tolerable error.");
disp("With tol = 1e-7, the computed root = 1.1 (upto 6 decimal places)");

disp("Secant method is expected to have a similar degree of convergence.");
