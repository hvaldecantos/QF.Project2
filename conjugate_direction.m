function [errors, points] = conjugate_direction(f, g, x0, epsilon, maxiterations, varargin)
    % Fletcher-Reeves conjugate gradient method
    x = x0;
    
    if(nargin>5)
        xstar = varargin{1};
    end
    
    i = 0;
    points = [x0];
    errors = [];

    gradF = g(x);
    d = -gradF; % first vector is the steepest descent direction

    while true
        i = i + 1;
        a = backtracking_line_search(f, g, d, x);
        x = x + a * d;

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
