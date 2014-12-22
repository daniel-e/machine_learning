% -- [d, idx] = nearestNeighbour(X, p)
%
% Finds the nearest neighbour between the patterns in X and
% the pattern p.
%
%  X     An m times n matrix with m patterns and n features.
%
%  p     An n dimensional column vector for which the nearest
%        neighbour is searched in X.
%
% RETURNS
%
%  d     The distance between p and the closest pattern in X,
%        i.e. the distannce between p and X(idx,:).
%
%  idx   The row number of the nearest neighbour in X.
function [label, idx] = knn(X, y, p, k)
	[sorted, pos] = sort(sumsq(bsxfun(@minus, X, p'), 2));
	idx = pos(1:k);
	labels = y(idx);
	u = unique(labels);
	[mval, i] = max(histc(labels, u));
	label = u(i);
end

%!test
%! X = [7 4 8; 9 3 3; 8 9 4; 0 3 7; 7 9 3; 3 6 2; 9 1 5; 5 3 3];
%! p = [4 3 2]';
%! y = [1 0 1 0 1 0 1 1]';
%! [label, indexes] = knn(X, y, p, 3);
%! assert (label, 0)
%! assert (indexes, [8 6 2]');
