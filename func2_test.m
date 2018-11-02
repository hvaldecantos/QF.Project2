function func2_test(method_name)

f = func2();
gf = func2gradient();
hf = func2hessian();

num_vars = 100;
max_iter = 10000;
epsilon = 1.0e-4;
initial_point = zeros(num_vars,1); % initial point shoud be in the domain of f

switch method_name
    case "gd"
        [errors, points] = gradient_descent_constrained(f, gf, initial_point, max_iter, epsilon);
    case "nw"
        [errors, points] = newton_constrained(f, gf, hf, initial_point, max_iter, epsilon);
    case "qn"
        [errors, points] = qnewton_constrained(f, gf, initial_point, max_iter, epsilon);
    otherwise
        sprintf("Method %s not implemented", method_name)
        return;
end

figure;
plot_error(errors, "log", 'red')
