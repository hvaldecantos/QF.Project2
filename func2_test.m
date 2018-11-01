f = func2();
gf = func2gradient();
hf = func2hessian();


num_vars = 100;

max_iter = 100;
epsilon = 1.0e-18;
initial_point = zeros(num_vars,1);
initial_point = floor(10000*rand(num_vars,1));
initial_point = repmat(1, num_vars, 1);



%[errors_gd, points_gd] = gradient_descent(f, gf, initial_point, max_iter, epsilon);

[errors_nw, points_nw] = newton(f, gf, hf, initial_point, max_iter, epsilon);

% qnewton is very sensitive to the initial point
[errors_qn, points_qn] = qnewton(f, gf, initial_point, max_iter, epsilon);


figError = figure;
%plot_error(errors_gd, "log", 'green')
%hold on
plot_error(errors_nw, "log", 'red')
hold on
plot_error(errors_qn, "log", 'blue')
