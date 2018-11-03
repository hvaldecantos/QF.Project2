function H = func3hessian()
	% x belongs to R2xm where each column is a vector 2x1
	% returns an array of matrices with the hessian for each point xi

    H = @hess;

    function h = hess(x)
        f3dx1x1 = @(x) 1200*x(1,:).^2 - 400*x(2,:) + 2;
        f3dx1x2 = @(x) -400*x(1,:);
        f3dx2x1 = @(x) -400*x(1,:);
        f3dx2x2 = @(x) repmat(200, size(x(1,:)));

        [n, m] = size(x);
        h = zeros(n, n*m);

        h(1, 1:n:n*m) = f3dx1x1(x);
        h(1, 2:n:n*m) = f3dx1x2(x);
        h(2, 1:n:n*m) = f3dx2x1(x);
        h(2, 2:n:n*m) = f3dx2x2(x);
    end
end
