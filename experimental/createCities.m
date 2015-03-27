function X = createCities(n)
	p = [10 + 5 * rand(n, 1) linspace(2 * pi / n, 2 * pi, n)'];
	x = p(:, 1) .* sin(p(:, 2));
	y = p(:, 1) .* cos(p(:, 2));
	X = [x y];
end
