function bisection(a, b, tol, max_it)

if a >= b | sign(f(a)) * sign(f(b)) >= 0
    disp("Invalid input")
    return
end

fprintf("%s %10s %10s %10s %10s %10s", ["iteration", "a", "b", "c", "b-c", "f(c)"]);
fprintf("\n")
% finding root
c = (a + b)/2; error = abs(b - c); iteration = 1;
while error > tol & iteration <= max_it
    if sign(f(a)) * sign(f(c)) <= 0
        b = c; 
    else 
        a = c;
    end
    c = (a + b)/2; error = abs(b - c);
    txt = sprintf('%d %20f %10f %10f %10f %10f', [iteration, a, b, c, error, f(c)]);
    disp(txt);
    iteration = iteration + 1;
end

disp(["Root: " + num2str(c)])