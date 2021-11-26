function [sol, A_new] = gauss_elm(A, b, pivot_true)
sz = size(A);
if sz(1) ~= sz(2)
    disp("Invalid dimesion of the coeficient matrix");
    return;
end
len = length(A);
% creating the augmented matrix
A = horzcat(A, b);
% pivoting
for i = 1:len-1
    if pivot_true == 1
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
    
    multiplier = A(i+1:end,i)./A(i,i);
    operator = vertcat(zeros(i, len+1), multiplier.*A(i,:));
    A = A - operator;
end
A_new = A; b = A(:, end);
sol = 1:len; sol(end) = b(end)/A(len, len);
% finding the solution
for i = len-1:-1:1
    temp = 0;
    for j = i+1:len
        temp = temp + sol(j)*A(i,j);
    end
    sol(i) = (b(i) - temp)/A(i,i);
end