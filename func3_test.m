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
max_iter = 200;
epsilon = 1.0e-8;
initial_point = [2; 2];


%[errors_gd, points_gd] = gradient_descent(f, gf, initial_point, max_iter, epsilon, known_minimum);

[errors_nw, points_nw] = newton(f, gf, hf, initial_point, max_iter, epsilon, known_minimum);

% qnewton is very sensitive to the initial point
[errors_qn, points_qn] = qnewton(f, gf, initial_point, max_iter, epsilon, known_minimum);

errors = errors_qn;
points = points_qn;

figure(figContour); hold on
plot_trace(points, 'red'); hold off

figure(fig3Dplot); hold on
plot3_trace(points, f, 'red'); hold off

figError = figure;
plot_error(errors_nw, "log", 'red')
hold on
plot_error(errors, "log", 'blue')
