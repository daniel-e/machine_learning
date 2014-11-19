# Machine learning in Octave

This directory contains functions useful for doing machine learning in Octave.

## Overview of functions

*General*

* `featureNormalization.m`: Normalizes the features of a matrix.
* `sigmoid.m`: Computes the sigmoid function.

*Linear Regression*

* `lrComputeCost.m`: Cost function for linear regression without regularization.
* `lrNormalEquationm.m`: Computes the exact solution to a linear regression problem.

## Example for linear regression

```octave
% create a data set along the line 2x+3 with random noise
x = (-10:0.5:10)';
y = 2*x+3 + 6*rand(length(x), 1)-3;

% create the design matrix
X = [ones(length(x), 1), x];

% compute the optimal solution for the optimization problem
% using the normal equation
theta = lrNormalEquation(X, y);

% predict one example at x_1 = 2
% value should be around 2*2+3 = 7
theta' * [1; 2]

% predict the value of all examples in X at once
% and plot it
p = X * theta;
plot(x, y, "x", x, p, "r", "linewidth", 2);
```
