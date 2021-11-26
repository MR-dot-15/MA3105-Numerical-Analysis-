function tbl(x_array)
fprintf("i\t P(x = 0.1)\t P(x = 0.3)\t P(x = 0.5)\n");
x_val = [0.1 0.3 0.5];
y = cos(x_array);
for i = 1:length(x_array)-1
    temp = interpol(x_val, x_array, i);
    fprintf("%i\t %.5f\t %.5f\t %.5f\t\n", [i temp]);
end