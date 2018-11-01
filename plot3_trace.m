function plot3_trace(points, f)
	% points belongs to R2xm, is an array of pointsi R2x1
	% f is the function f(x) = z
    plot3(points(1,:),points(2,:), f(points));
    plot3(points(1,:), points(2,:), f(points), 'o');
end
