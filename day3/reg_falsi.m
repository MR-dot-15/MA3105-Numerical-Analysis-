function reg_falsi(a, iter, tol)

if f(a(1))*f(a(2))>0
    disp("Incorrect boundary values");
end

fprintf("%s \t\t%s \t\t%s \t\t%s %10s \n", ["n", "a", "f(a)", "|a_k - a_k+1|", "rel error"]);
fprintf('%d \t%f \t%f \n', [0, a(1), f(a(1))]);
fprintf('%d \t%f \t%f \n', [1, a(2), f(a(2))]);

% initiation of the array
arr = 1:(iter + 2);
arr = [a, arr]; a = arr(1); b = arr(2);
% root
alpha = 1.134724138;

for i = 1:iter
    arr(i+2) = b - f(b)*(b-a)/(f(b)-f(a));
    if f(a)*f(arr(i+2))<=0
        b = arr(i+2);
    end
    if f(b)*f(arr(i+2))<=0
        a = arr(i+2);
    end
    
    rel_error = (alpha - arr(2+i))/alpha; error = abs(arr(2+i) - arr(1+i));
    fprintf('%d \t%f \t%f \t%f \t%f \n', [i+1, arr(2+i), f(arr(2+i)), error, rel_error]);
    if error <= tol
        return
    end
end
disp(arr)