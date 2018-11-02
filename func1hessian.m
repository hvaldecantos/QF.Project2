function H = func1hessian(x)
	% x belongs to Rnxm where each column is a vector 2x1
	% returns an array of matrices with the hessian for each point xi

    H = @(x) repmat(diag((1:100) * 2), 1, size(x,2));
end
