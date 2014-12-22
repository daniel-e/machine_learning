% -- [h] = entropy(x)
%
% Computes the entropy of the given vector. This is done by computing the
% probability of each element in the vector (i.e. the relative frequency)
% and computing h = -sum(p(x_i) * log2(p(x_i))).
%
%  x     The vector of elements.
%
% RETURNS
%
%  h     The Shannon entropy.
 
function [h] = entropy(x)
	p = histc(x, unique(x)) / length(x);
	h = -sum(p .* log2(p));
end

%!test
%! x = [1 1 1 0 0 0];
%! h = entropy(x);
%! assert (h, 1);
%! x = [1 0 0 3 3 3 8];
%! h = entropy(x);
%! assert (h, -1/7*log2(1/7) - 2/7*log2(2/7) - 3/7*log2(3/7) - 1/7*log2(1/7));
