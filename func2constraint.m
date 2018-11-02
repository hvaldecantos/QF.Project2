function g = func2constraint()
    [A, b, c] = func2loadcoefficients();
    %g = @(x) b - A*x > 0;
    g = @(x) min(b - A*x) > 0;
end
