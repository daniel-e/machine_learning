1;

more off;
rand('seed', 123);  % seed prng to get reproducible results

npop = 100;         % size of initial population
niters = 100;       % number of generations / iterations
n = 10;             % number of cities
mutationRate = 0.001;

X = createCities(n);
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
		Pn = [Pn; createOffsprings(P(select(s), :), P(select(s), :))];
	end
	P = mutatePopulation(Pn, mutationRate);
end

% plot:
% 1) the result, i.e. the path of the best solution in the last generation
subplot(1, 2, 1);
best = X(P(s(1, 2), :), :);
best = [best; best(1, :)];
plot(best(:, 1), best(:, 2), 'linewidth', 2);

% 2) the average fitness vs generation
subplot(1, 2, 2);
plot(J, 'linewidth', 2);
