function [errors, points] = func1_test(method_name)

f = func1();
gf = func1gradient();
hf = func1hessian();

num_vars = 100;
max_iter = 10000;
epsilon = 1.0e-4;
initial_point = ones(num_vars,1); % initial point shoud be in the domain of f
label = "";
known_minimum = zeros(num_vars,1);

tic
switch method_name
    case "gd"
        label = "F1 - GD";
        [errors, points] = gradient_descent(f, gf, initial_point, max_iter, epsilon, known_minimum);
    case "nw"
        label = "F1 - NW";
        [errors, points] = newton(f, gf, hf, initial_point, max_iter, epsilon, known_minimum);
    case "qn"
        label = "F1 - QN";
        [errors, points] = qnewton(f, gf, initial_point, max_iter, epsilon, known_minimum);
    case "cd"
        label = "F1 - CD";
        [errors, points] = conjugate_direction(f, gf, initial_point, max_iter, epsilon, known_minimum);
    otherwise
        sprintf("Method %s not implemented", method_name)
        return;
end
toc

figure;
plot_error(errors, "log", 'red', label)
sprintf("Minimum value f1 is %s ", f(points(:,size(points,2))))
