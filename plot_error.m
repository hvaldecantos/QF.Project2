function plot_error(errors, varargin, color, label)
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
    title(sprintf("%s\n(err %.4e in %d its.)",label, errors(iterations), iterations));
end
