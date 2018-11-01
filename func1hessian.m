function H = func1hessian(x)
	% x belongs to Rnxm where each column is a vector 2x1
	% returns an array of matrices with the hessian for each point xi

    [n, m] = size(x);
    H = repmat(diag((1:n) * 2), 1, m);
end
