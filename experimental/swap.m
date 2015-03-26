function r = swap(v, x, y)
	r = v;
	r(x) = v(y);
	r(y) = v(x);
end
