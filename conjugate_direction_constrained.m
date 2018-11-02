function [errors, points] = conjugate_direction_constrained(f, g, x0, epsilon, maxiterations, varargin)
    % Fletcher-Reeves conjugate gradient method
    x = x0;
    
    passesConstraint = func2constraint();
    
    if(nargin>5)
        xstar = varargin{1};
    end
    
    i = 0;
    points = [x];
    errors = [];

    gradF = g(x);
    d = -gradF;

    while true
        i = i + 1;
        %a = backtracking_line_search(f, g, d, x);
        a = backtracking_line_search_constrained(f, g, d, x, passesConstraint);
        x = x + a * d;

        if(nargin>5) current_err = norm(f(x) - f(xstar));
        else         current_err = norm(f(x) - f(x0));
        end

        errors = [errors; current_err];
        points = [points, x];        

        gradFp = gradF;
        gradF = g(x);
        beta = (gradF'*gradF)/(gradFp'*gradFp);
        d = -gradF + beta * d;
        x0 = x;
        
        if((current_err <= epsilon) || (i >= maxiterations)); break; end
    end
end
