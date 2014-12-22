function X = createData2(n)
	x = 1:n;
	x = x / n;
	y = (x + rand(1, n) * 0.5 .* (1 - x)) * 0.9 + 0.05;
	X = [x; y]';
end

