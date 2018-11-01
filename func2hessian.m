function h = func2hessian()
    [A, b, c] = func2loadcoefficients();
    h = @(x) A' * diag(1./((b - A*x).^2))*A;
end
