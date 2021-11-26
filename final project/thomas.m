function x = thomas(a, b, c, f)
% b -> main diagonal
% c -> super diagonal
% a -> sub diagonal
n = length(b);
a = [0 a]; 
for i = 2:n
    coff = a(i)/b(i-1);
    b(i) = b(i) - coff * c(i-1);
    f(i) = f(i) - coff * f(i-1);
end
if b(end) == 0
    disp("Failed to solve");
    return;
end

x = 1:n; x(end) = f(end)/b(end);
for i=n-1:-1:1
    x(i)=(f(i)-c(i)*x(i+1))/b(i);
end