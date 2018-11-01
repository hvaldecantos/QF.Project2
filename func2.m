function f = func2()
    [A, b, c] = func2loadcoefficients();
    f = @(x) c' * x - sum(log(b - A * x));
end
