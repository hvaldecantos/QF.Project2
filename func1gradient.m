function g = func1gradient(x)
	% x belongs to Rnxm where each column is a vector nx1
    % returns the gradient of the same dimension of its input

    n = size(x, 1);
    g = x.*2.*[1:n]';
end
