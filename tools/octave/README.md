# Machine learning with Octave

This directory contains functions useful for doing machine learning in Octave.

## Overview of functions

*General*

* `sigmoid.m`: Computes the sigmoid function.

*Features*

* `normalizeFeatures.m`: Normalizes the features of a matrix.
* `combineFeatures.m`: Computes new features by combining existing features.
* `boostFeatures.m`: Computes new features by raising existing features to dfferent powers.
* `tfidf.m`: Computes the term frequency-inverse document frequency of a document-term matrix.

*Linear Regression*

* `lrComputeCost.m`: Cost function for linear regression without regularization.
* `lrNormalEquation.m`: Computes the exact solution to a linear regression problem without regularization.
* `lrGradientDescent.m`: Minimizes a linear regression problem with Gradient descent.

## Examples

### Linear regression

#### Normal equation without regularization

```matlab
% create a data set along the line 2x+3 with random noise
x = (-10:0.5:10)';
y = 2*x+3 + 6*rand(length(x), 1)-3;

% create the design matrix
X = [ones(length(x), 1), x];

% compute the optimal solution for the optimization problem
% using the normal equation
theta = lrNormalEquation(X, y);

% predict one example at x_1 = 2
% the value should be around 2*2+3 = 7
theta' * [1; 2]

% predict the value of all examples in X at once
% and plot it
p = X * theta;
plot(x, y, 'x', x, p, 'r', 'linewidth', 2);

% the cost of the solution can be computed as follows:
lrComputeCost(X, y, theta)
```

#### Increase number of features

To approximate complex non-linear functions with linear regression one method is to compute new features from existing features. Here's an example.

```matlab
% create a data set along the curve sin(x)+0.5*x
x = (-10:0.5:10)';
y = sin(x) + x * 0.5 + 2 * rand(length(x), 1) - 1;

% from the existing features create higher dimensional features
xn = boostFeatures(x, 4);
k = combineFeatures(xn, 2, 4);

% create the design matrix
X = [ones(size(k, 1), 1), k];

% compute the optimal solution for the optimization problem
% using the normal equation
theta = lrNormalEquation(X, y);

% predict the value of all examples in X at once and plot it
p = X * theta;
plot(x, y, 'x', x, sin(x) + 0.5*x, 'b', x, p, 'r', 'linewidth', 2);
```

#### Gradient descent vs normal equation

To approximate complex non-linear functions with linear regression one method is to compute new features from existing features. Here's an example.

```matlab
% create a data set along the curve sin(x)+0.5*x
x = (-10:0.5:10)';
y = sin(x) + x * 0.5 + 2 * rand(length(x), 1) - 1;

% from the existing features create higher dimensional features
k = combineFeatures(boostFeatures(x, 5), 2, 5);

% create the design matrix
X = [ones(size(k, 1), 1), k];

% compute the optimal solution for the optimization problem using the normal
% equation
% we have to normalize the features first when using gradient descent because
% they differ due to the boost and combine step very much
[N, mu, sigma] = normalizeFeatures(X);
theta1 = lrGradientDescent(N, y, 0.1, 1000);
theta2 = lrNormalEquation(N, y);

% predict the value of all examples in X at once and plot it
p1 = N * theta1;
p2 = N * theta2;
plot(x, y, 'x', x, sin(x) + 0.5*x, 'b', 
	x, p1, 'r', 'linewidth', 2, x, p2, 'g', 'linewidth', 2);
legend('points', 'curve without noise', 
	'gradient descent', 'normal equation', 'location', 'southeast');
```

This example creates the following plot:

![plot of gradient descent vs normal equation](https://github.com/daniel-e/machine_learning/blob/plots/tools/octave/lr_gradient_descent_vs_normal_equation.png)
