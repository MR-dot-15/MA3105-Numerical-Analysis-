tot = 20; lim = 10;
% randomly selected 10 elements
% from {1, 2, ..., 20}
x = randperm(tot, lim)
max = x(1); index = 1;
for i = 1:lim
  if max <= x(i)
    max = x(i); index = i;
  endif
endfor

disp(["Max value: ", num2str(max), " at ", num2str(index), "th position"])