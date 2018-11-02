function g = func1gradient()
	% x belongs to Rnxm where each column is a vector nx1
    % returns the gradient of the same dimension of its input

    g = @(x) x.*2.*[1:100]';
end
