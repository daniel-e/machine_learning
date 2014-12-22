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
function [distance, idx] = nearestNeighbour(X, p)
	[d, idx] = min(sumsq(bsxfun(@minus, X, p'), 2));
	distance = sqrt(d);
end

%!test
%! X = [6 5 3; 3 2 0; 6 8 7; 2 0 7; 2 1 2];
%! p = [4 3 2];
%! [distance, idx] = nearestNeighbour(X, p');
%! assert (distance, 2.4495, .0001);
%! assert (idx, 2);
