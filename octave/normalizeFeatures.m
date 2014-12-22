% -- [X_norm, mu, sigma] = normalizeFeatures(X)
%
% Normalizes the features of the given matrix.
%
%  X     matrix (not the design matrix), each row corresponds to an example
%        each column corresponds to a feature
%
% RETURNS
%
%  X_norm  Matrix of normalized features.
%
%  mu      Vector of the mean of the elements of each columns.
%
%  sigma   Vector of the standard deviation of the elements of each column.
function [X_norm, mu, sigma] = normalizeFeatures(X)
	% TODO handle the case when sigma is zero
	epsilon = 1e-6;
	mu = mean(X);
	sigma = std(X);
	sigma(abs(sigma) <= epsilon) = 1;
	X_norm = bsxfun(@rdivide, bsxfun(@minus, X, mu), sigma);
end

%!test
%! X = [2, 4, 3, 8; 1, 4, 4, 2; 7, 5, 7, 2];
%! [X_norm, mu, sigma] = normalizeFeatures(X);
%! assert (X_norm(:, 1), [-0.41478; -0.72587; 1.14065], 0.00001)
%! assert (X_norm(:, 2), [-0.57735; -0.57735; 1.15470], 0.00001)
%! assert (X_norm(:, 3), [-0.80064; -0.32026; 1.12090], 0.00001)
%! assert (X_norm(:, 4), [ 1.15470; -0.57735;-0.57735], 0.00001)
%! assert (mu, [3.3333, 4.3333, 4.6667, 4.0000], 0.0001)
%! assert (sigma, [3.21455, 0.57735, 2.08167, 3.46410], 0.00001)
