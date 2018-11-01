function plot_trace(points, color)
	% points belongs to R2xm, is an array of pointsi R2x1
    line(points(1,:),points(2,:), 'Color', color);
    plot(points(1,:), points(2,:), 'o', 'Color', color);
end
