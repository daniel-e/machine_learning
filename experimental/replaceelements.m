function v = replaceelements(x, e, val)
	v = x;
	for i = 1:length(e)
		v(v == e(i)) = [val];
	end
end

%!test
% assert(replaceelements([1,2,3], [2], -1) == [1, -1, 3])
% assert(replaceelements([1,2,3], [2,3], -1) == [-1, -1, -1])
% assert(replaceelements([1,2,3], [1,2,3], -1) == [-1, -1, -1])
% assert(replaceelements([1,2,3], [3,4], -1) == [1, 2, -1])
