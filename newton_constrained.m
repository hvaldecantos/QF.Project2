function [errors, points] = newton(f, g, h, x0, maxiter, E, varargin)
    % f: is a function such that f(x) : Rnx1 -> R
    % g: is the gradient of f, g(x) : Rnx1 -> Rnx1
    % h: is the hessian of f, h(x) : Rnx1 -> Rnx(n*m)
    % x0: is the initial point, belongs to Rnx1
    % maxiter: is the maximum number of iterations
    % E: is the acceptable error between iterations
    % vargarin: can include a point x* (xstar) for a known minimum so the
    % error is computed with that minimum
    % this function returns the error in each iteration and the points found

    if(nargin>7)
        xstar = varargin{1};
    end

    i = 0;
    errors = [];
    points = x0;
    
    passesConstraint = func2constraint();

    a = 1;
    while true
        i = i + 1;

        p = h(x0) \ -g(x0);
        % use the Moore-Penrose pseudoinverse of the hessian
        %p = pinv( h(x0)) * -g(x0);
        a = backtracking_line_search_constrained(f, g, p, x0, passesConstraint);
        x1 = x0 + a*p;

        if(nargin>6) current_err = norm(f(x1) - f(xstar));
        else         current_err = norm(f(x0) - f(x1));
        end

        errors = [errors; current_err];
        points = [points, x1];

        x0 = x1;
        if((current_err <= E) || (i >= maxiter)); break; end
    end
end
