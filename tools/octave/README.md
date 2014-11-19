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

```
x = (-10:0.5:10)';
y = 2*x+3 + 6*rand(length(x), 1)-3;
clf;
plot(x, y, "x");
X = [ones(length(x), 1), x];
theta = lrNormalEquation(X, y);
% predict one example at x_1 = 2
theta' * [1; 2]
p = X * theta;
hold("on");
plot(x, p, "r", "linewidth", 2);
```
