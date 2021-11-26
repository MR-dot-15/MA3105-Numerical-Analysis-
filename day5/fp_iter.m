function val = fp_iter(init, max_iter, tol, mark)
x_array = 1:max_iter+1; x_array(1) = init;
for i = 2:max_iter+1
    if mark == 1
        x_array(i) = f1(x_array(i-1));
    elseif mark == 2
        x_array(i) = f2(x_array(i-1));
    elseif mark == 3
        x_array(i) = f3(x_array(i-1));
    end
    if abs(x_array(i) - x_array(i-1)) <= tol
        x_array = x_array(1:i);
        val = x_array;
        %break;
        return;
    end
end
val = x_array; 