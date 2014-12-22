function [theta, fval, cost_history] = linearRegression(X, y)

	m = size(X, 1); % number of examples
	n = size(X, 2); % number of features
	t = rand(n, 1); % initial theta

	options = optimset("GradObj", "on", "MaxIter", 100, "OutputFcn", @fx);
	[theta, fval] = fminunc(@(t)(lrCostGrad(X, y, t)), t, options);
	cost_history = fx(0, 0, "getresult");
end

function ret = fx(t, optimvalues, state)
	persistent fvec = [];

	if strcmp(state, "init") == 1
		fvec = [];
	end

	if strcmp(state, "getresult") == 1
		ret = fvec;
	else
		fvec = [fvec; optimvalues.fval];
		ret = false;
	end
end

function [J, grad] = lrCostGrad(X, y, theta)
	hvals = lrHypothesis(X, theta);
	J = mse(hvals, y);
	grad = mseGrad(X, hvals, y);
end

