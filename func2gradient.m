function g = func2gradient()
    [A, b, c] = func2loadcoefficients();
    g = @(x) c + A'*(1./(b - A*x));
end
