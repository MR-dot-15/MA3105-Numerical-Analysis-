x = -8:0.1:8; y = x;
[X, Y] = meshgrid(x, y);
z = sqrt(X.^2 + Y.^2);
z = sin(z)./z;
title('z = sqrt(x^2 + y^2)')
xlabel('X'); ylabel('Y')
hold
mesh(x, y, z);