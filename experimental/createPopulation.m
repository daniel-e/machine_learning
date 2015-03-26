% n is the number of populations that should be created
function P = createPopulation(n, l)
	P = randperm(l);
	for i = 2:n
		P = [P; randperm(l)];
	end
end

