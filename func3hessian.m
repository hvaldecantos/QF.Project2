function H = func3hessian(x)
	% x belongs to R2xm where each column is a vector 2x1
	% returns an array of matrices with the hessian for each point xi
    f3dx1x1 = @(x) 1200*x(1,:).^2 - 400*x(2,:) + 2;
    f3dx1x2 = @(x) -400*x(1,:);
    f3dx2x1 = @(x) -400*x(1,:);
    f3dx2x2 = @(x) repmat(200, size(x(1,:)));

    [n, m] = size(x);
    H = zeros(n, n*m);

    H(1, 1:n:n*m) = f3dx1x1(x);
    H(1, 2:n:n*m) = f3dx1x2(x);
    H(2, 1:n:n*m) = f3dx2x1(x);
    H(2, 2:n:n*m) = f3dx2x2(x);
end
