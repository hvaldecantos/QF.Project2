function [errors, points] = gradient_descent(f, g, x0, maxiter, E, varargin)
    % f: is a function such that f(x) : Rnx1 -> R
    % g: is the gradient of f, g(x) : Rnx1 -> Rnx1
    % x0: is the initial point, belongs to Rnx1
    % maxiter: is the maximum number of iterations
    % E: is the acceptable error between iterations
    % vargarin: can include a point x* (xstar) for a known minimum so the
    % error is computed with that minimum
    % this function returns the error in each iteration and the points found

    if(nargin>5)
        xstar = varargin{1};
    end
    
    i = 0;
    errors = [];
    points = x0;

    while true
        i = i + 1;

        p = -g(x0);
        a = backtracking_line_search(f, g, p, x0);
        x1 = x0 + a*p;

        if(nargin>5) current_err = norm(f(x1) - f(xstar));
        else         current_err = norm(f(x0) - f(x1));
        end

        errors = [errors; current_err];
        points = [points, x1];
        
        x0 = x1;
        if((current_err <= E) || (i >= maxiter)); break; end
    end
end
