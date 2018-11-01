function f = func1(x)
    n = size(x, 1);
    f = [1:n] * x.^2;
end
