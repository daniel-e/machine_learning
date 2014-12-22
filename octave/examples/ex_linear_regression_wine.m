1;

addpath('..');
addpath('../../data/wine');

% ---------- load the dataset ----------
[X, y] = loadWineData('../../data/wine/winequality-red.csv');

% find the solution
[theta, fval, cost_history] = linearRegression(X, y);

printf("error: %f\n", fval);

% ---------- plot ----------
figure('Position', [0, 0, 900, 400]);
% plot the data points
subplot(1, 2, 1);
hold on;
hist(y, 1:10);
title('input data');
xlabel('quality');
axis([0 10]);
grid on;

% plot error on training set after each iteration
subplot(1, 2, 2);
n = length(cost_history);
plot(1:n, cost_history, 'linewidth', 2);
title('Error on training set');
xlabel('number of iterations')
ylabel('error');
axis([0 10,]);
grid on;

% create png of plot
% print ex_linear_regression_wine.png -dpng "-S900,480" -F:6

% [y, X * theta]
