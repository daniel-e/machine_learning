% -- [theta, J_history] = lrGradientDescent(X, y)
% -- [theta, J_history] = lrGradientDescent(X, y, alpha)
% -- [theta, J_history] = lrGradientDescent(X, y, alpha, iterations)
% -- [theta, J_history] = lrGradientDescent(X, y, alpha, iterations, @f)
%
% Uses gradient descent to minimize a linear regression problem.
%
%  X     The m x (n+1) dimensional design matrix for m examples each with
%        n features. Each row corresponds to an example and each column
%        corresponds to a feature. The first column of the design matrix
%        is 1 which is the parameter for the bias.
%
%  y     m dimensional column vector of actual values for each example
%
%  alpha       Learning rate. Default is 0.1
%
%  iterations  Number of iterations. Default is 100
%
%  f           A cost function. If a cost function is given at each
%              iteration the cost function for the current theta is
%              computed and stored in J_history.
%              The signature must be as follows: f(X, y, theta)
%
% RETURNS
%
%  theta       The parameters for the linear regression problem.
%
%  J_history   If f is set to a cost function that cost function is
%              used to compute the cost at each iteration and the
%              results are stored in this iterations-dimensional
%              vector. If f is not set, lrComputeCost is used to compute
%              the cost.
function [theta, J_history] = lrGradientDescent(varargin)

	% default values
	num_iters = 100;
	alpha = 0.1;

	% get arguments
	X = varargin{1};
	y = varargin{2};
	m = size(y, 1);   % number of training examples
	n = size(X, 2);   % number of features
	theta = rand(n, 1);

	for i = 3:length(varargin)
		if i == 3
			alpha = varargin{i};
		elseif i == 4
			num_iters = varargin{i};
		elseif i == 5
			theta = varargin{i};
		end
	end

	J_history = zeros(num_iters, 1);
	for i = 1:num_iters
		theta = theta - alpha / m * (X' * (X * theta - y));
		if length(varargin) == 6
			costFunction = varargin{6};
			J_history(i) = costFunction(X, y, theta);
		else
			J_history(i) = lrComputeCost(X, y, theta);
		end
	end
end

%!test
%! X = [1, .81, .53, .01, .03; 1, .09, .10, .19, .12; 1, .21, .12, .38, .39];
%! y = [1, 0, 1]';
%! tinit = ones(5, 1) / 2;

%! [theta, J] = lrGradientDescent(X, y, 0.1, 3000, tinit, @lrComputeCost);
%! assert (theta, [-0.70769; 1.53417; 0.73863; 1.36080; 1.99473], 0.00001);
%! j = J(end);
%! assert (j, 1.3423e-06, 1.0e-7)

%! [theta, J] = lrGradientDescent(X, y, 0.1, 3000, tinit);
%! assert (theta, [-0.70769; 1.53417; 0.73863; 1.36080; 1.99473], 0.00001);
%! j = J(end);
%! assert (j, 1.3423e-06, 1.0e-7)

%! [theta, J] = lrGradientDescent(X, y, 0.1, 3000);
%  note: this is a non-deterministic test. it can fail
%! assert (theta, [-0.70769; 1.53417; 0.73863; 1.36080; 1.99473], 0.8);
%! j = J(end);
%  note: this is a non-deterministic test. it can fail
%! assert (j, 2.0687e-06, 1.0e-4)

