% -- [F] = boostFeatures(X, d)
%
% Computes new features by rasing existing features to different powers.
%
%  X     This is an m x n matrix with m examples and n features. For each
%        feature the function computes the value of that feature raised
%        to the powers p = 1, 2, ..., d to form new features.
%
%  d     The maximum exponent.
%
% RETURNS
%
%  F     Matrix of the n * d new features.
function F = boostFeatures(X, d)
	n = size(X, 2);  % number of features / columns
	m = size(X, 1);  % number of examples
	F = zeros(m, n * d);
	k = 0;
	for i = 1:d
		for j = 1:n
			k = k + 1;
			F(:,k) = X(:,j) .^ i;
		end
	end
end

%!test
%! X = [1, 2; 3, 4; 5, 6];
%! Xn = boostFeatures(X, 1);
%! assert (Xn, X)
%! Xn = boostFeatures(X, 2);
%! assert (Xn, [1,2,1,4; 3,4,9,16; 5,6,25,36]);
%! Xn = boostFeatures(X, 3);
%! assert (Xn, [1,2,1,4,1,8; 3,4,9,16,27,64; 5,6,25,36,125,216]);

