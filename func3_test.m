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



% with [0; 0] it takes all the iteration
% with [1; 0] it rapidly goes to the minimum but the function is too much 
% plane around the global minimum that it cannot reach the minimum
% when the starting point is further from the minimum it seems to be better
known_minimum = [1; 1];
max_iter = 10000;
epsilon = 1.0e-8;

[errors, points] = gradient_descent(f, gf, [-2; -2], max_iter, epsilon, known_minimum);

figure(figContour);
plot_trace(points);

figure(fig3Dplot);
hold on
plot3_trace(points, f);

figError = figure;
plot_error(errors, "log")
