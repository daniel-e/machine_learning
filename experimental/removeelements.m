function v = removeelements(x, e)
	v = x;
	for i = 1:length(e)
		v = v(v != e(i));
	end
end

%!test
% assert(removeelements([1,2,3], [2]) == [1, 3])
% assert(removeelements([1,2,3], [2,3]) == [1])
% assert(removeelements([1,2,3], [1,2,3]) == [])
% assert(removeelements([1,2,3], [3,4]) == [1,2])
