function [s, x_val, x_data, y]...
    = cubic_spline(a, b, n, flag, deriv)
% mesh
h = (b-a)/(n-1);
x_data = a:h:b;
% preparing y data
%y = exp(x_data);
y = exp(x_data);

% Ax = f
% A is the tridiagonal matrix
f = 1:n;
for i=2:n-1
    f(i) = ((y(i+1)-y(i)) - (y(i)-y(i-1)))/h;
end

if flag == 0
   % natural spline constraint
    f(1) = 0; f(end) = 0;
elseif flag == 1
    % clamped spline constraint
    
    % in order to clamp f', following snippet is needed
    % f(1) = deriv(1) - (y(2)-y(1))/h; 
    % f(end) = deriv(2) - (y(end)-y(end-1))/h;
    % b_diag = [(h/6 - (x_data(2)-a)^2/(2*h)) ...
    %    2*ones(1, n-2)/3 ...
    %    (-h/6 + (x_data(end-1)-b)^2/(2*h))];
    %a_diag = [ones(1, n-2)/6 ...
    %    (h/6 - (x_data(end)-b)^2/(2*h))];
    %c_diag = [(-h/6 + (x_data(1)-a)^2/(2*h)) ...
    %    ones(1, n-2)/6];
    
    % this is f'' clamped
    f(1) = deriv(1); f(end) = deriv(2);
end

% setting up the main/super/sub diagonal
% -for a uniform mesh
b_diag = [1 2*ones(1, n-2)/3 1];
a_diag = [ones(1, n-2)/6 0];
c_diag = [0 ones(1, n-2)/6];

% solving Ax = f, for x
sol = thomas(a_diag, b_diag, c_diag, f);

% setting up a new mesh
% to find the cubic interpolate over [a,b]
x_val = a:0.01:b;
m = length(x_val);
s = 1:m;
% counter = 1,...,n
k = 1;
for i=1:m
    x_l = x_data(k);
    x_n = x_data(k + 1);
    x = x_val(i);
    s(i) = ((sol(k)*(x_n-x)^3 + sol(k+1)*(x-x_l)^3)/6 ...
        + (y(k)*(x_n-x)+y(k+1)*(x-x_l)) ...
        - (h^2*(sol(k)*(x_n-x)+sol(k+1)*(x-x_l)))/6)/h;
    % if x value > right limit of [x_k, x_k+1]
    % counter += 1
    if (a + 0.01*i) > x_n
        k = k + 1;
    end
end