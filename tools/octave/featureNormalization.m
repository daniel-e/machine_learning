%Normalizes the features of the given matrix.
%
% featureNormalization(X)
% X      matrix (not the design matrix), each row corresponds to an example
%        each column corresponds to a feature
function [X_norm, mu, sigma] = featureNormalization(X)
	mu = mean(X);
	sigma = std(X);
	X_norm = bsxfun(@rdivide, bsxfun(@minus, X, mu), sigma);
end

%!test
%! X = [2, 4, 3, 8; 1, 4, 4, 2; 7, 5, 7, 2];
%! [X_norm, mu, sigma] = featureNormalization(X);
%! assert (X_norm(:, 1), [-0.41478; -0.72587; 1.14065], 0.00001)
%! assert (X_norm(:, 2), [-0.57735; -0.57735; 1.15470], 0.00001)
%! assert (X_norm(:, 3), [-0.80064; -0.32026; 1.12090], 0.00001)
%! assert (X_norm(:, 4), [ 1.15470; -0.57735;-0.57735], 0.00001)
%! assert (mu, [3.3333, 4.3333, 4.6667, 4.0000], 0.0001)
%! assert (sigma, [3.21455, 0.57735, 2.08167, 3.46410], 0.00001)
