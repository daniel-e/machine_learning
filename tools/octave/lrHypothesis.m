% -- [hvals] = lrHypothesis(X, theta)
%
% Computes the value of the hypothesis for the given examples and parameters.
%
%  X      The design matrix.
%
%  theta  The parameters.
%
% RETURNS
%
%  hvals The predictions.
function [hvals] = lrHypothesis(X, theta)
	hvals = X * theta;
end

%!test
%! X = [1, 0.81, 0.53, 0.01, 0.03; 1, 0.09, 0.1, 0.19, 0.12; 1, 0.21, 0.12, 0.38, 0.39];
%! theta = [0.3; 0.5; 0.2; 0.9; 0.7];
%! assert (lrHypothesis(X, theta), [0.841; 0.62; 1.044], .000001)
