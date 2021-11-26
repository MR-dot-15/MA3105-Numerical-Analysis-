function main()
for h = [0.2, 0.1, 0.05]
    fun1 = @(x)exp(-x);
    fun2 = @(x)x.^2+2*x+2-2*(x+1)*log(x+1);
    fprintf("h\t\t\t x\t\t\t y(x)\t\t\t Error\t\t Rel err\n"); 
    x1 = 1:5;

    x0 = 0; xf = 6; y0 = 1;
    y1 = euler(x0, y0, xf, h, 'deriv1');
    fprintf("Problem 1\n");
    for i = x1
        if i == 1
            fprintf("%f\t", [h]);
        else
            fprintf("\t\t\t");
        end
        y_est = y1(int16(i/h+1));
        err = abs(fun1(i)-y_est);
        rel = err/y_est;
        fprintf("%f\t %f\t %f\t %f\t\n", [i, y_est, err, rel])
    end

    x0 = 0; xf = 6; y0 = 2;
    y1 = euler(x0, y0, xf, h, 'deriv2');

    fprintf("Problem 2\n");
    for i = x1
        if i == 1
            fprintf("%f\t", [h]);
        else
            fprintf("\t\t\t");
        end
        y_est = y1(int16(i/h+1));
        err = abs(fun2(i)-y_est);
        rel = err/y_est;
        fprintf("%f\t %f\t %f\t %f\t\n", [i, y_est, err, rel])
    end
end