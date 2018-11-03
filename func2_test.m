function [errors, points] = func2_test(method_name)

f = func2();
gf = func2gradient();
hf = func2hessian();

num_vars = 100;
max_iter = 10000;
epsilon = 1.0e-8;
initial_point = zeros(num_vars,1); % initial point shoud be in the domain of f

label = "";

tic
switch method_name
    case "gd"
        label = "F2 - GD";
        [errors, points] = gradient_descent_constrained(f, gf, initial_point, max_iter, epsilon);
    case "nw"
        label = "F2 - NW";
        [errors, points] = newton_constrained(f, gf, hf, initial_point, max_iter, epsilon);
    case "qn"
        label = "F2 - QN";
        [errors, points] = qnewton_constrained(f, gf, initial_point, max_iter, epsilon);
    case "cd"
        label = "F2 - CD";
        [errors, points] = conjugate_direction_constrained(f, gf, initial_point, max_iter, epsilon);
    otherwise
        sprintf("Method %s not implemented", method_name)
        return;
end
toc

figure;
plot_error(errors, "log", 'red', label)
f(points(:,size(points,2)))
sprintf("Minimum value f2 is %s ", f(points(:,size(points,2))))
