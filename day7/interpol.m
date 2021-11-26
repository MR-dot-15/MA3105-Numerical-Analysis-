function val = interpol(x_val, x_array, n)
x_array = x_array(1:n+1);
y = cos(x_array); 
D_val = D(x_array, y);
val = D_val(1); temp = 1;
for i = 2:n+1
    temp = temp .* (x_val - x_array(i-1));
    val = val + temp .* D_val(i);
end