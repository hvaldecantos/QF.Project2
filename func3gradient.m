function g = func3gradient()
	% x belongs to R2xm where each column is a vector 2x1
	% returns an array of vectors with the gradient for each point xi
	f3dx1 = @(x) 2 .* x(1,:) - 400 .* x(1,:) .* (x(2,:) - x(1,:).^2) - 2;
	f3dx2 = @(x) 200 .* x(2,:) - 200 .* x(1,:).^2;

    %f3dx1 = @(x) 200 .* (x(2,:) - x(1,:).^2) .* (-2*x(2,:)) + (-2) .* (1 - x(1,:));
	%f3dx2 = @(x) 200 .* (x(2,:) - x(1,:).^2);

	g = @(x) [f3dx1(x); f3dx2(x)];
end
