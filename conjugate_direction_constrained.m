function [errors, points] = conjugate_direction_constrained(f, g, x0, maxiterations, epsilon, varargin)
    % Fletcher-Reeves conjugate gradient method

    if(nargin>5)
        xstar = varargin{1};
    end

    i = 0;
    points = [x0];
    errors = [];
    passesConstraint = func2constraint();

    gradF = g(x0);
    d = -gradF; % first vector is the steepest descent direction

    while true
        i = i + 1;
        %a = backtracking_line_search(f, g, d, x0);
        a = backtracking_line_search_constrained(f, g, d, x0, passesConstraint, 0.1);
        x = x0 + a * d;

        if(nargin>5) current_err = norm(f(x) - f(xstar));
        else         current_err = norm(f(x) - f(x0));
        end

        errors = [errors; current_err];
        points = [points, x];        

        gradFp = gradF; % previous gradiant (steepest descent direction)
        gradF = g(x);
        beta = (gradF'*gradF)/(gradFp'*gradFp); % Fletcher–Reeves formula
        d = -gradF + beta * d;
        x0 = x;

        if((current_err <= epsilon) || (i >= maxiterations)); break; end
    end
end
