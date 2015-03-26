function [c1, c2] = crossover(a, b)
	i = randi(size(a, 2) + 1);
	j = randi(size(b, 2) + 1);
	l = min([i, j]);
	r = max([i, j]);
	if r > l
		c1 = newchild(a, b, l, r);
		c2 = newchild(b, a, l, r);
	else
		c1 = a;
		c2 = b;
	end
	
end

function c = newchild(a, b, l, r)
	suba = a(:, l:r - 1);
	xx = replaceelements(b, suba, -1);
	xx = [xx(1:r - 1) suba xx(r:length(b))];
	c = removeelements(xx, [-1]);
end

