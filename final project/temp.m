function temp()
format long g;
mesh = linspace(0, pi, 200);
f = sin(mesh);
for n = 4:2:20
    x = linspace(0, pi, n);
    y = sin(x);
    s1 = cubic_spline1(x, y, mesh, 1, [1 -1]);
    sl = linear_spline(x, y, mesh);
    l = 1:200;
    for j = 1:200
        l(j) = lag_interpol(x, y, mesh(j));
    end
    if n == 10
        scatter(x, y); hold on;
        plot(mesh, s1, '--');
        plot(mesh, l, '.-');
        plot(mesh, sl, '--.');
        plot(mesh, f);
        legend("Data points, n = 10", "Clamped cubic",...
            "Lagrange pol (deg 9)", "Linear spline", "sin(x)",...
            'Location', 'south');
        xlim([0 pi]);
        grid('on'); hold off;
    end
    fprintf("%i & %f & %f & %f & ",...
        n, max(abs(f-s1)), max(abs(f-l)), max(abs(f-sl)));
    fprintf("%f & %f & %f\\\\ \n\\hline \n",...
        sqrt(sum((f-s1).^2)), sqrt(sum((f-l).^2)), sqrt(sum((f-sl).^2)));
end
    

% for n = 5:5:40
%     [s, mesh, x, y] = cubic_spline(-1, 1, n, 0);
%     ss = linear_spline(x, y, mesh);
%     f = exp(mesh);
%     now = [max(abs(ss-f)), max(abs(s-f)),...
%         sqrt(sum((ss-f).^2)), sqrt(sum((s-f).^2))];
%     if n>5
%         fprintf("%i & %f & %f & %f & %f\\\\\n\\hline\n",...
%             n, temp(1)/now(1), temp(2)/now(2),...
%             temp(3)/now(3), temp(4)/now(4));
%         temp = now;
%     else
%         temp = now;
%     end
% end

% for n = 5:5:40
%     [s, mesh, x, y] = cubic_spline(-1, 1, n, 0);
%     s1 = cubic_spline1(x, y, mesh, 1, [exp(-1) exp(1)]);
%     f = exp(mesh);
%     fprintf("%i & %f & %f & %f & %f\\\\\n\\hline\n",...
%         n, max(abs(f-s)), max(abs(f-s1)),...
%         sqrt(sum((f-s).^2)), sqrt(sum((f-s1).^2)));
%     if n == 20
%         scatter(x, y, "filled");hold on;
%         plot(mesh, s, '--'); 
%         plot(mesh, s1, '.-');
%         plot(mesh, f);
%         legend("Data points, n=20",...
%          "Natural cubic spline", "Clamped cubic spline",...
%          "exp(x)", 'Location',  'northwest'); 
%         grid("on"); hold off;
%     end
% end

% [s, mesh, x, y] = cubic_spline(-1, 1, 30, 0);
% ss = linear_spline(x, y, mesh);
% scatter(x, y, 'filled'); hold on;
% plot(mesh, exp(mesh)); 
% plot(mesh, s, 'k--'); 
% plot(mesh, ss, 'b.-');
% legend("Data, n = 30",...
%  "Original function", "Natural cubic spline",...
%  "Linear spline", 'Location',  'northwest'); 
% grid("on"); hold off;

% for n=5:5:30
%     [s, mesh, x, y] = cubic_spline(100, 120, n, 0);
%     fprintf("%i & %f & %f\\\\\n\\hline\n", n, max(abs(s-mesh)), sqrt(sum(s-mesh)));
% end

% [s, mesh, x, y] = cubic_spline(1, 4, 4, 0);
% m = length(mesh);
% sol = 1:m;
% for i = 1:m
%     sol(i) = f(mesh(i));
% end
% fprintf("Inf %f 2 %f", max(abs(s-sol)), sqrt(sum(s-sol)));
