function val = D(x, y)

if length(x) ~= length(y)
    disp("Unsupported input"); return;
end

val = y;
for i = 2:length(y)
    for j = length(y):-1:i
        val(j) = (val(j) - val(j-1))/(x(j) - x(j - i + 1));
    end
end