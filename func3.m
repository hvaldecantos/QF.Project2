function f = func3(x)
	% x belongs to R2xm where each column is a vector 2x1
	f = 100 * (x(2,:) - x(1,:).^2).^2 + (1 - x(1,:)).^2;
end
