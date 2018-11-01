function [errors, points] = qnewton(f, g, x, maxiter, E, varargin)
    % f: is a function such that f(x) : Rnx1 -> R
    % g: is the gradient of f, g(x) : Rnx1 -> Rnx1
    % h: is the hessian of f, h(x) : Rnx1 -> Rnx(n*m)
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
    points = x;
    
    F = eye(length(x));

    while true
        i = i + 1;
        
        x0 = x;
        p = -F * g(x);
        a = backtracking_line_search(f, g, p, x0);
        x = x + a*p;
        
        s = a*p;
        y = g(x) - g(x0);
        
        F = F + (y'*(F*y + s)/(y'*s)^2)*(s*s') - (s*y'*F + F*y*s')/(y'*s);

        if(nargin>6) current_err = norm(f(x) - f(xstar));
        else         current_err = norm(f(x) - f(x0));
        end

        errors = [errors; current_err];
        points = [points, x];

        if((current_err <= E) || (i >= maxiter)); break; end
    end
end
