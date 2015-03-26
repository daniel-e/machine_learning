function f = fitnessOfAll(fitnessFunction, P)
	f = [];
	for i = 1:size(P, 1)
		f = [f; fitnessFunction(P(i, :))];
	end
end
