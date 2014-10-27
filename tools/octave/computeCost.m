%Computes the cost for linear regression.
%
% computeCost(X, y, theta)
% X      is the design matrix
% y      column vector of predictions
% theta  parameter vector
function J = computeCost(X, y, theta)
	c = X * theta - y;
	J = c' * c / (2 * length(y));
end

%!test
%! X = [1, .81, .53, .01, .03; 1, .09, .10, .19, .12; 1, .21, .12, .38, .39];
%! theta = [.3, .5, .2, .9, .7]';
%! y = [1, 0, 1]';
%! assert (computeCost(X, y, theta), .068603, .000001)
