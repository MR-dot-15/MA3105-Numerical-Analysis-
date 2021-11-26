x = 3 * ones(3, 2);
y = 4 * ones(2, 3);
z = x * y;
disp("z"); disp(z);
disp("Diagonal of z"); disp(diag(z));
z(2,2) = 2 * z(1,1);
z(3,3) = 2 * z(2,2);
disp("Final z"); disp(z);