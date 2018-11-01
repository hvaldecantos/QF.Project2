f = @func3;
gf = @func3gradient;
hf = @func3hessian;

[x, y] = meshgrid(-2:0.1:2);
% all points arranged as X = [x1, ..., xn] from the meshgrid
X = [x(:)'; y(:)'];
fig3Dplot = figure;
% makes z a grid of values from points in X
z = reshape(f(X), size(x));
surf(x, y, z);

figContour = figure;
contour(x, y, z, 0:.01:2);
hold on

pxy = gf(X);
px = reshape(pxy(1,:), size(x));
py = reshape(pxy(2,:), size(x));
quiver(x, y, px, py);
hold off



% with [0; 0] it takes all the iteration
% with [1; 0] it rapidly goes to the minimum but the function is too much 
% plane around the global minimum that it cannot reach the minimum
% when the starting point is further from the minimum it seems to be better
known_minimum = [1; 1];
max_iter = 100;
epsilon = 1.0e-8;

[errors_gd, points_gd] = gradient_descent(f, gf, [-2; -2], max_iter, epsilon, known_minimum);

figure(copyobj(figContour,0)); hold on
plot_trace(points_gd, 'red'); hold off

figure(fig3Dplot); hold on
plot3_trace(points_gd, f, 'blue'); hold off

figError = figure;
plot_error(errors_gd, "log", 'blue')

[errors_nw, points_nw] = newton(f, gf, hf, [-2; -2], max_iter, epsilon, known_minimum);

figure(figContour); hold on
plot_trace(points_nw, 'red'); hold off

figure(fig3Dplot); hold on
plot3_trace(points_nw, f, 'red'); hold off

figure(figError); hold on
plot_error(errors_nw, "log", 'red')
