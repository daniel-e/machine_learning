% -- [f] = fitnessOfAll(fitnessFunction, P)
%
% Computes the fitness of all individuals.
%
%  fitnessFunction  The fitness function used for one individual.
%
%  P                The population.
%
% RETURNES
%
%  f    Row vector.
function [f, m] = fitnessOfAll(fitnessFunction, P)

	% size of population
	n = size(P, 1);

	% compute the fitness for each individual
	f = arrayfun(@(i) fitnessFunction(P(i, :)), 1:n)';
	m = mean(f);

	% normalize the fitness so that the sum is equal to one
	% and append a column which represents the row index in the population
	f = [f / sum(f) (1:n)'];

	% sort by fitness, descending
	f = flipud(sortrows(f, 1));
end

