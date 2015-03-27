function M = mutatePopulation(P, mutationRate)
	M = [];
	for i = 1:size(P, 1)
		x = P(i, :);
		n = size(x, 2);
		for j = 1:n
			if rand(1, 1) <= mutationRate
				pos = randi(n);
				x = swap(x, j, pos);
			end
		end
		M = [M; x];
	end
end

function r = swap(v, x, y)
	r = v;
	r(x) = v(y);
	r(y) = v(x);
end
