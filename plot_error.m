function plot_error(errors, varargin)
    % errors is a vector Rnx1 of error values
    % varargin can be the scale of y axis
    scale = "linear";
    if(nargin>1)
        scale = varargin{1};
    end
    iterations = length(errors);
    
    if(scale == "log")
        semilogy(1:iterations, errors);
    else
        plot(1:iterations, errors);
    end
    title(sprintf("Error vs. Iteration\n(reached err %.4e in %d its.)",errors(iterations), iterations));
end
