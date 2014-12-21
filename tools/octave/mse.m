% -- [J] = mse(hvals, y)
%
% Computes the mean squared error, i.e. the average of the squares of
% errors of an estimator.
%
%  hvals  A vector of predicted values, for each example one value.
%
%  y      A vector of targe values, for each example one value.
%
% RETURNS
%
%  J     The cost.
function [J] = mse(hvals, y)
	J = sumsq(hvals - y) / (2 * length(y));
end

%!test
%! hvals = [0.841; 0.62; 1.044];
%! y = [1, 0, 1]';
%! assert (mse(hvals, y), .068603, .000001)
