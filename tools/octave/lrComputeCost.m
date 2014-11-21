% -- [J] = lrComputeCost(X, y, theta)
%
% Computes the cost for linear regression using the least squares method.
%
%  X     is the m x (n+1) dimensional design matrix for m examples each with
%        n features. Each row corresponds to an example and each column
%        corresponds to a feature. The first column of the design matrix
%        is 1 which is the parameter for the bias.
%
%  y     m dimensional column vector of actual values for each example
%
% theta  (n+1) dimenstional parameter vector
%
% RETURNS
%
%  J     The value cost.
function [J] = lrComputeCost(X, y, theta)
	% compute the 
	c = X * theta - y;
	J = c' * c / (2 * length(y));
end

%!test
%! X = [1, .81, .53, .01, .03; 1, .09, .10, .19, .12; 1, .21, .12, .38, .39];
%! theta = [.3, .5, .2, .9, .7]';
%! y = [1, 0, 1]';
%! assert (lrComputeCost(X, y, theta), .068603, .000001)
