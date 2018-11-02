function a = backtracking_line_search_constrained(f, g, p, x, passesConstraint, varargin)
    % f is a function such that f(x) : Rnx1 -> R
    % g is the gradient of f, g(x) : Rnx1 -> Rnx1
    % p is a descent direction vector that belongs to Rnx1
    % x is an array of vectors that belongs to Rnxm, x = [x1, x2, .., xn] where xi is a vector nx1
    % returns the step size according to slope factor a

    c = 0.1;   % a fraction of decrease 1% to 3% is usually taken
    rho = 0.5; % typically between 0.1 (crude search) and 0.8 (less crude search)
    
    if(nargin<6)
        a = 1;
    else
        a = varargin{1};
    end

    % constraint to avoid picking a point out of the domain
    % and/or falling into an imaginary codomain space
    while ~passesConstraint(x + a*p)
        a = rho*a;
    end
    
    while (f(x + a*p) > f(x) + c*a*p'*g(x))
        a = rho*a;
    end
end
