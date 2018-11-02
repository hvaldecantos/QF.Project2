% Fletcher-Reeves conjugate gradient method
function [xstar, fstar, counter, error, points, fks] = conjugate_direction(f, g, x0, epsilon, maxiterations)
    x = x0;
    counter = 0;
    error = 1e300;
    points = [x];
    fks = [feval(f, x)];
    gradF = g(x);
    d = -gradF;

    while error > epsilon && counter < maxiterations
        counter = counter + 1;
        %alpha = fminsearch(@(a) feval(f,x + a*d), 0.0);
        alpha = backtracking_line_search(f, g, d, x, 0.6);
        x = x + alpha * d;
        points = [points, x];
        fks = [fks; feval(f, x)];
        error = norm(d);
        gradFp = gradF;
        gradF = g(x);
        beta = (gradF'*gradF)/(gradFp'*gradFp);
        d = -gradF + beta * d;
    end
    xstar = x;
    fstar = feval(f, x);
end
