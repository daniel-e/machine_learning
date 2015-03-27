function [X] = crossover(a, b)
	p = sort(randi(size(a, 2) + 1, 1, 2));
	X = [newchild(a, b, p(1), p(2)); newchild(b, a, p(1), p(2))];
end

%-!test
%-! newchild([1,2,3,4], [4,3,2,1], 2, 2)
%- assert(newchild([1,2,3,4], [4,3,2,1], 2, 2), [4, 3, 2, 0])

function c = newchild(a, b, l, r)
	c = a;
	if r > l
		% get the substring which needs to be copied into b
		s = a(:, l:r - 1);
		% replace all elements in b which occur in the substring s of a
		x = replaceelements(b, s, -1);
		% insert substring s into b and remove all replaced values
		c = removeelements([x(1:r - 1) s x(r:end)], [-1]);
	end
end


function v = replaceelements(x, e, val)
	v = x;
	for i = 1:length(e)
		v(v == e(i)) = [val];
	end
end

%-!test
%- assert(replaceelements([1,2,3], [2], -1) == [1, -1, 3])
%- assert(replaceelements([1,2,3], [2,3], -1) == [-1, -1, -1])
%- assert(replaceelements([1,2,3], [1,2,3], -1) == [-1, -1, -1])
%- assert(replaceelements([1,2,3], [3,4], -1) == [1, 2, -1])

function v = removeelements(x, e)
	v = x;
	for i = 1:length(e)
		v = v(v != e(i));
	end
end

%-!test
%- assert(removeelements([1,2,3], [2]) == [1, 3])
%- assert(removeelements([1,2,3], [2,3]) == [1])
%- assert(removeelements([1,2,3], [1,2,3]) == [])
%- assert(removeelements([1,2,3], [3,4]) == [1,2])
