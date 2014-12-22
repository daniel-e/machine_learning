1;

addpath('..');
addpath('../../data/synthetic');

% ---------- create the dataset ----------
% seed the random number generator with a constant to get reproducable results
rand('seed', 17);
% n = number of examples
n = 50;
data = createData2(n);
X = [ones(n, 1), data(:, 1)];
y = data(:, 2);

% find the solution
[theta, fval, cost_history] = linearRegression(X, y)

% ---------- plot ----------
figure('Position', [0, 0, 900, 400]);
% plot the data points
subplot(1, 2, 1);
hold on;
plot(X(:,2), y, 'xo', 'markersize', 8, 'linewidth', 2, 'markeredgecolor', 'black', 'markerfacecolor', 'yellow');
title('input data');
grid on;
% plot 
plot([0, 1], [1, 0; 1, 1] * theta, 'linewidth', 2);

% plot error on training set after each iteration
subplot(1, 2, 2);
n = length(cost_history);
plot(1:n, cost_history, 'linewidth', 2);
title('Error on training set');
xlabel('number of iterations')
ylabel('error');
grid on;

% create png of plot
% print ex_linear_regression.png -dpng "-S900,480" -F:6

