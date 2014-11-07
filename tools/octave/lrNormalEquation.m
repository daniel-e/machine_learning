% -- [theta] = lrNormalEquation(X, y)
%
% Computes the exact solution to a linear regression problem.
%
%  X      The m x (n+1) dimensional design matrix. Each row corresponds
%         to an example and each column corresponds to a feature. The first
%         column is set to 1 for the bias.
%
%  y      The m dimensional column vector of observed values.
%
% RETURNS
%
%  theta  The parameters which minimize the least square error.
function [theta] = lrNormalEquation(X, y)
	theta = pinv(X'*X)*X'*y;
end

%!test
%! X = [1, .81, .53, .01, .03; 1, .09, .10, .19, .12; 1, .21, .12, .38, .39];
%! y = [1, 0, 1]';
%! theta = lrNormalEquation(X, y);
%! assert (theta, [-0.68505; 1.64507; 0.52541; 1.25444; 2.05089], 0.00001)
