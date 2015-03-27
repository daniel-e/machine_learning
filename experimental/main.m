1;

more off;
hold on;
clf;

rand('seed', 123);  % seed prng to get reproducible results

npop = 100;         % size of initial population
niters = 100;       % number of generations / iterations
n = 10;             % number of cities
mutationRate = 0.001;

X = createCities(n);
P = createPopulation(npop, n);  % initial population
J = zeros(niters, 1);           % history of average fitness

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


	% plot the best solution of the current generation
	subplot(1, 2, 1);
	best = X(P(s(1, 2), :), :);
	best = [best; best(1, :)];
	plot(best(:, 1), best(:, 2), '-o', 'linewidth', 2, 'markerfacecolor', 'b');
	title('best solution');
	axis("off");
	refresh();

	% plot the average fitness vs generation
	subplot(1, 2, 2);
	plot(J(1:iter), 'linewidth', 2);
	xlabel('iteration');
	title('fitness');
	xlim([0 niters]);
	grid on;
	refresh();

	%filename = sprintf('/tmp/image%05d.png', iter);
	%print (filename, '-dpng', '-S640,400');
	% avconv -framerate 10 -i 'image%05d.png' -c:v libx264 -r 30 -crf 4 -pix_fmt yuv420p out.mp4
end

