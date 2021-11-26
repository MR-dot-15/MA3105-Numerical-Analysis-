function [x] = gssd(A, b, x_init, error, iter)
sz = size(A);
if sz(1) ~= sz(2)
    disp("Invalid dimesion of the coeficient matrix");
    return;
end
disp("Gauss Seidel iteration");
len = length(A);
for i = 1:length(A)
    max_element = abs(A(i,i)); max_index = i;
    for j = i+1:len
        if abs(A(j,i))>max_element
            max_element = abs(A(j,i));
            max_index = j;
        end
    end
    temp = A(i,:); A(i,:) = A(max_index,:);
    A(max_index,:) = temp;
end
x = x_init; 
for i = 1:iter
    temp = x;
    fprintf("%i\t", [i]);
    for j = 1:len
        sum = 0;
        for k = 1:len
            if j== k
                continue;
            end
            sum = sum + A(j,k)*x(k);
        end
        x(j) = (b(j) - sum)/A(j,j);
        fprintf("%f\t", [x(j)]);
    end
    err = norm(temp-x);
    fprintf("%f\n", [err]);
    if err < error
        break
    end
end