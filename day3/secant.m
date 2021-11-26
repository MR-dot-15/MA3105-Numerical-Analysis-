function secant(a, iter, tol)

fprintf("%s \t\t%s \t\t%s \t\t%s %10s \n", ["n", "a", "f(a)", "a_k - a_k+1", "rel error"]);
fprintf('%d \t%f \t%f \n', [0, a(1), f(a(1))]);
fprintf('%d \t%f \t%f \n', [1, a(2), f(a(2))]);

% initiation of the array
arr = 1:iter;
% combining user input a = [a0, a1] with arr
arr = [a, arr];
% root
alpha = 1.134724138;

for i = 1:iter
    % recursive relation
    arr(2+i) = arr(1+i) - f(arr(i+1))*(arr(i+1) - arr(i))/(f(arr(i+1)) - f(arr(i)));
    
    rel_error = (alpha - arr(2+i))/alpha;
    fprintf('%d \t%f \t%f \t%f \t%f \n', [i+1, arr(2+i), f(arr(2+i)), arr(2+i) - arr(1+i), rel_error]);
    % checking error constraint
    if abs(arr(2+i) - arr(1+i)) <= tol
        return
    end
end