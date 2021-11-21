x = randperm(20);
% creating repetition
x(3) = x(1); x(13) = x(8); x(17) = x(11);
disp(x);
for i = 1:length(x)
  if sum(x == x(i)) > 1
    disp(["Duplicates: ", num2str(x(i))]);
  endif
endfor