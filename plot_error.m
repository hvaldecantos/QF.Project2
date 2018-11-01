function plot_error(errors, varargin, color)
    % errors is a vector Rnx1 of error values
    % varargin can be the scale of y axis
    scale = "linear";
    if(nargin>1)
        scale = varargin{1};
    end
    iterations = length(errors);
    
    if(scale == "log")
        semilogy(1:iterations, errors, 'Color', color);
    else
        plot(1:iterations, errors, 'Color', color);
    end
    title(sprintf("Error vs. Iteration\n(reached err %.4e in %d its.)",errors(iterations), iterations));
end
