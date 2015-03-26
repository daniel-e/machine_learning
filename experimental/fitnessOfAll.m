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
function f = fitnessOfAll(fitnessFunction, P)
	f = [];
	for i = 1:size(P, 1)
		f = [f; fitnessFunction(P(i, :))];
	end
end

