function X = createData3(n)
	x = 1:n;
	x = x / n;
	y = (sin(8 * x) .^ 2 + x) * 0.5 + 0.5 + rand(1, n) * 0.3;
	X = [x; y]';
end
