function p = select(X)
	x = rand(1, 1);
	s = 0;
	p = X(1, 2);
	for i = 1:size(X, 1)
		s = s + X(i, 1);
		if s >= x
			p = X(i, 2);
			break;
		end
	end
end
