function regula_falsi_nonvec(a, b, iter, tol)
fun = @(x)(x^6 - x -1);
if fun(a)*fun(b)>0
    disp("wrong boundary values")
    return
end
for i = 1:iter
    c = b - fun(b)*(b-a)/(fun(b)-fun(a));
    if abs(c-b)<= tol
        disp(['root: ', num2str(c), ', iter: ', num2str(i), ', error: ', num2str(abs(b-c))]);
        return 
    end
    if fun(c)*fun(b)<=0
        a = b;
    end
    b = c;
end