function [X] = crossover(a, b)
	i = randi(size(a, 2) + 1);
	j = randi(size(b, 2) + 1);
	l = min([i, j]);
	r = max([i, j]);
	if r > l
		X = [newchild(a, b, l, r); newchild(b, a, l, r)];
	else
		X = [a; b];
	end
	
end

function c = newchild(a, b, l, r)
	suba = a(:, l:r - 1);
	xx = replaceelements(b, suba, -1);
	xx = [xx(1:r - 1) suba xx(r:length(b))];
	c = removeelements(xx, [-1]);
end

