function [errors, points] = func3_test(method_name)

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
max_iter = 10000;
epsilon = 1.0e-8;
initial_point = [0; 0];
%initial_point = [-2; -2]; % qnewton does not converge NaN

label = "";
tic
switch method_name
    case "gd"
        label = "F3 - GD";
        [errors, points] = gradient_descent(f, gf, initial_point, max_iter, epsilon, known_minimum);
    case "nw"
        label = "F3 - NW";
        [errors, points] = newton(f, gf, hf, initial_point, max_iter, epsilon, known_minimum);
    case "qn"
        label = "F3 - QN";
        [errors, points] = qnewton(f, gf, initial_point, max_iter, epsilon, known_minimum);
    case "cd"
        %[xstar, fstar, counter, errors, points, fks] = conjugate_direction(f, gf, initial_point, epsilon, max_iter, known_minimum);
        label = "F3 - CD";
        [errors, points] = conjugate_direction(f, gf, initial_point, epsilon, max_iter, known_minimum);
    otherwise
        sprintf("Method %s not implemented", method_name)
        return;
end
toc

figure(figContour); hold on
plot_trace(points, 'red'); hold off

figure(fig3Dplot); hold on
plot3_trace(points, f, 'red'); hold off

figure;
plot_error(errors, "log", 'red', label)
