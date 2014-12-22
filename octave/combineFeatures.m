% -- [F] = combineFeatures(X, mink, maxk)
%
% Computes additional features by combining all available features in X.
%
% For each (n choose i) subsets of different features for
% i = mink, mink+1, ..., maxk this function computes a new feature
% by multiplying the features of the that subset.
%
%  X     Matrix where each row corresponds to an example and each column
%        corresponds to a feature. 
%
%  mink  Minimum number of features in a subset.
%
%  maxk  Maximum number of features in a subset.
%
% RETURNS
%
%  F     Matrix of sum_{i=mink}^maxk (n choose i) new features.
function F = combineFeatures(X, mink, maxk)
	n = size(X, 2);  % number of features / columns
	m = size(X, 1);  % number of examples
	% cn = number of new features
	cn = 0;
	for i = mink:maxk
		cn = cn + nchoosek(n, i);
	end
	F = zeros(m, cn);
	idx = 0;
	for k = mink:maxk
		c = nchoosek(1:n, k);
		for i = 1:size(c, 1)
			row = c(i, :);  % get i-th row of combination matrix
			r = ones(m, 1);
			for j = 1:length(row)
				r = r .* X(:, row(j));
			end
			idx = idx + 1;
			F(:, idx) = r;
		end
	end
end

%!test
%! X = [16, 2, 3; 5, 11, 10; 9, 7, 6; 4, 14, 15];
%! Xn = combineFeatures(X, 2, 2);
%! assert (Xn, [32, 48, 6; 55, 50, 110; 63, 54, 42; 56, 60, 210]);
%! Xn = combineFeatures(X, 3, 3);
%! assert (Xn, [96; 550; 378; 840]);
%! X = [16,2,3,13;5,11,10,8;9,7,6,12;4,14,15,1];
%! Xn = combineFeatures(X, 3, 3);
%! assert (Xn, [96,416,624,78; 550,440,400,880; 378,756,648,504; 840,56,60,210]);
%! X = [16, 2, 3; 5, 11, 10; 9, 7, 6; 4, 14, 15];
%! Xn = combineFeatures(X, 2, 3);
%! assert (Xn, [32,48,6,96; 55,50,110,550; 63,54,42,378; 56,60,210,840]);
