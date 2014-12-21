1;

% ---------- create the dataset ----------
% seed the random number generator with a constant to get reproducable results
rand("seed", 17);
% n = number of examples
n = 20;
% X = the design matrix
% y = target values
X = [ones(1, n); 1:n]';
y = X(:,2) + rand(n, 1) * 4 - 2 + 2;

% find the solution
[theta, fval, cost_history] = linearRegression(X, y)

% ---------- plot ----------
clf;
% plot the data points
subplot(1, 2, 1);
hold on;
plot(X(:,2), y, "xo", "markersize", 8, "linewidth", 2, "markeredgecolor", "black", "markerfacecolor", "yellow");
title("input data");
grid on;
% plot 
plot([0, 20], [1, 0; 1, 20] * theta, "linewidth", 2);

% plot error on training set after each iteration
subplot(1, 2, 2);
n = length(cost_history);
plot(1:n, cost_history, "linewidth", 2);
title("Error on training set");
xlabel("number of iterations")
ylabel("error");
grid on;
