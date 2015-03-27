% n is the number of populations that should be created
function P = createPopulation(n, l)
	P = zeros(n, l);
	for i = 1:n
		P(i, :) = randperm(l);
	end
end

