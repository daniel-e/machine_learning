1;

npop = 100;  % size of initial population

load points;
X = [x y];
n = size(X, 1);
P = createPopulation(npop, n);

% P = initial population
%     each row represents an individual and contains a permuation of X
% n = number of cities
% X = (x,y) coordinates for each city; one city per row

more off;
disp("");
disp("number of cities"), disp(n);
disp("number of permutations"), disp(factorial(n));

niters = 100;
best = [];
J = zeros(niters, 1);

for iter = 1:niters
	iter

	% i is an individual, i.e. a permutation of 1:n
	f = fitnessOfAll(@(i) fitnessOfOne(X(i, :)), P);
	J(iter) = mean(f);

	% normalize the fitness so that the sum is equal to one
	% and append a column which represents the row index
	f = [f / sum(f) (1:size(f, 1))'];

	% sort by fitness descending; best at first row
	s = flipud(sortrows(f, 1));

	% print length of path of best individual
	v = 1 / fitnessOfOne(X(P(s(1, 2), :), :))

	best = X(P(s(1,2), :), :);
	best = [best; best(1, :)];

	Pn = [];
	for i = 1:npop / 2
		a = select(s);
		b = select(s);

		if rand(1, 1) >= 0.6
			Pn = [Pn; crossover(P(a, :), P(b, :))];  % crossover
		else
			Pn = [Pn; P(a, :); P(b, :)]; % copy parents
		end
	end

	P = Pn;
	%P = mutatePopulation(Pn);
end

subplot(1, 2, 1);
plot(best(:, 1), best(:, 2), "linewidth", 3);
subplot(1, 2, 2);
plot(1:length(J), J, "linewidth", 3);
