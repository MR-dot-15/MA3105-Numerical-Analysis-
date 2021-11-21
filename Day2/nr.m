function nr(a, iter, tol)

fprintf("%s \t\t%s \t\t%s \t\t%s %10s \n", ["n", "a", "f(a)", "a_k - a_k+1", "rel error"]);
fprintf('%d \t%f \t%f \n', [0, a, f(a)]);
% initiating the array
roots = 1:1:iter+1; roots(1) = a;
% root
alpha = 1.134724138;
% iteration --->
for i = 1:iter
    roots(i+1) = roots(i) - f(roots(i))/deriv(roots(i)); 
    rel_error = (alpha - roots(i+1))/alpha;
    fprintf('%d \t%f \t%f \t%f \t%f \n', [i, roots(i), f(roots(i)), roots(i) - roots(i+1), rel_error]);
    if abs(roots(i) - roots(i+1)) <= tol
        return
    end
end