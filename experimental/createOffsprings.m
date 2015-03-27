function X = createOffsprings(a, b)
	if rand(1, 1) >= 0.6
		X = crossover(a, b);
	else
		X = [a; b];
	end
end
