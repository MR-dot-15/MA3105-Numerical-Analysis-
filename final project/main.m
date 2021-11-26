function main(a, b)
% pre-set # of points
n_set = [10 20 40];

t = tiledlayout(1,3);
t.TileSpacing = 'compact';
t.Padding = 'compact';

for j = 1:3
    n = n_set(j);
    h = (b-a)/(n-1);
    % to be un-commented and included in line 15
    % for clamped cubic
    %deriv = [exp(a) exp(b)];
    
    nexttile
    
    [s, mesh, x_d, y_d] = cubic_spline(a, b, h, n);
    % L_inf error, defined in cubic_spline
    %disp("error infty:"); disp(e1);
    % L_2 error, defined in cubic_spline
    %disp("mse:"); disp(e2);
    
    plot(mesh, s, '--', 'LineWidth', 1.5); hold on;
    scatter(x_d, y_d, 'filled');
    plot(mesh, exp(mesh)); 
    data_point_label = "Data points, n=" + num2str(n);
    legend("Cubic spline interpolate", data_point_label,...
     "Original function", 'Location',  'northwest'); 

    grid('on');
end
hold off;