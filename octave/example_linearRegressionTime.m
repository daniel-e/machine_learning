1;

% ---------- create the dataset ----------
% seed the random number generator with a constant to get reproducable results
rand("seed", 17);
% m = number of examples
% n = number of features
m = 100000;
n = 100;
% X = the design matrix
% y = target values
X = [ones(m, 1), rand(m, n)];
y = rand(m, 1);

% h    = X * theta       -> O(mn) multiplications
% mse  = ~ sumsq(h - y)  -> O(m) multiplications
% grad = ~ X' * (h - y)  -> O(mn) multiplications

tic
[theta, fval, cost_history] = linearRegression(X, y);
toc

i = length(cost_history)
plot(1:i, cost_history, "linewidth", 2);
