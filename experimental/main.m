1;

npop = 100;    % size of initial population
niters = 100;  % number of generations / iterations
mutationRate = 0.001;

more off;
load points;
X = [x y];
n = size(X, 1);                 % number of cities
P = createPopulation(npop, n);  % initial population
J = zeros(niters, 1);

for iter = 1:niters
	iter

	% i is an individual, i.e. a permutation of 1:n
	% s = fitness sorted descending
	% m = average fitness
	[s, m] = fitnessOfAll(@(i) fitnessOfOne(X(i, :)), P);
	J(iter) = m;

	Pn = [];
	for i = 1:npop / 2
		a = P(select(s), :);
		b = P(select(s), :);

		if rand(1, 1) >= 0.6
			[a, b] = crossover(a, b);
		end
		Pn = [Pn; a; b];
	end

	P = mutatePopulation(Pn, mutationRate);
end

subplot(1, 2, 1);
best = X(P(s(1,2), :), :);
best = [best; best(1, :)];
plot(best(:, 1), best(:, 2), "linewidth", 2);

subplot(1, 2, 2);
plot(1:length(J), J, "linewidth", 2);
