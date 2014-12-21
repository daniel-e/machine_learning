# Machine learning with Octave

This directory contains functions useful for doing machine learning in Octave.

**Table of Contents**

- [Overview of functions](#overview-of-functions)
  - [General](#general)
  - [Features](#features)
  - [Linear regression](#linear-regression)
  - [Visualization](#visualization)
  - [Support Vector Machines](#support-vector-machines)
  - [Nearest Neighbours](#nearest-neighbours)
  - [Information Theory](#information-theory)
- [Examples](#examples)
  - [Linear regression](#linear-regression-1)
    - [Normal equation without regularization](#normal-equation-without-regularization)
    - [Increase number of features](#increase-number-of-features)
    - [Gradient descent vs normal equation](#gradient-descent-vs-normal-equation)
    - [Visualization](#visualization-1)
  - [SVM](#svm)
    - [Installing LIBSVM](#installing-libsvm)
    - [Two-class SVM](#two-class-svm)

## Overview of functions

### General

* `sigmoid.m`: Computes the sigmoid function.
* `mse.m`: Computes the mean square error.
* `mseGrad.m`: Computes the gradient for the mean square error.

### Features

* `normalizeFeatures.m`: Normalizes the features of a matrix.
* `combineFeatures.m`: Computes new features by combining existing features.
* `boostFeatures.m`: Computes new features by raising existing features to dfferent powers.
* `tfidf.m`: Computes the term frequency-inverse document frequency of a document-term matrix.

### Linear Regression

* `lrHypothesis.m`: Computes the hypothesis.
* `lrNormalEquation.m`: Computes the exact solution to a linear regression problem without regularization.
* `lrGradientDescent.m`: Minimizes a linear regression problem with Gradient descent.
* `linearRegression.m`: Solves a linear regression problem.

### Visualization

* `visualizeInstances.m`: Visualize 2-dimenstional instances belonging to at most two classes.

### Support Vector Machines

To use a support vector machine as a classifier you have to install [LIBSVM](http://www.csie.ntu.edu.tw/~cjlin/libsvm/).

* `svmTrain.m`: Training of a SVM.
* `svmPredict.m`: Predict instances with an SVM.
* `svmDecisionBoundary.m`: Get the decision boundary from an SVM model.

### Nearest Neighbours

(TODO)

* `nearestNeighbour.m`: Find the nearest neighbour for a pattern.
* `knn.m`: Find the k nearest neighbours.

### Information Theory

(TODO)

* `entropy.m`: Computes the enropy of a vector.

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
mse(hypLinReg(X, theta), y);
```

![plot of linear regression using normal equation](https://github.com/daniel-e/machine_learning/blob/plots/tools/octave/linear_regresssion_normal_equation.png)

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

![plot of linear regression with increased feature dimension](https://github.com/daniel-e/machine_learning/blob/plots/tools/octave/linear_regresssion_increase_features.png)

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

### Visualization

The following Octave code creates a data set which contains 100 points where the first and second dimension are selected at random in the interval [0,1]. All points for which the first dimension is smaller than the second dimension are assigned the class label 1. All other points are assigned the class label 0.

```matlab
% create a data set
X = rand(100, 2);
% create the class labels
y = X(:, 1) < X(:, 2);
% visualize
visualizeInstances(X, y);
```

The result is a plot like the following one:

![plot of instances belonging to two classes](https://github.com/daniel-e/machine_learning/blob/plots/tools/octave/visualize_instances.png)

### SVM

#### Installing LIBSVM

To use support vector machines you have to install [LIBSVM](http://www.csie.ntu.edu.tw/~cjlin/libsvm/). LIBSVM provides an interface for MATLAB and Octave. For this example we have used LIBSVM 3.20. The first step is to compile LIBSVM. To do this extract the file libsvm-3.20.tar.gz and go into the directory `libsvm-2.30/matlab`. Start Octave and in Octave execute the command `make`. This compiles the interface of LIBSVM. Now, when everything compiled successfully and you type ``svmtrain()``` you should see the following output which we have reduced to the first few lines of output:

```
Usage: model = svmtrain(training_label_vector, training_instance_matrix, 'libsvm_options');
libsvm_options:
-s svm_type : set type of SVM (default 0)
	0 -- C-SVC		(multi-class classification)
	1 -- nu-SVC		(multi-class classification)
	2 -- one-class SVM
	3 -- epsilon-SVR	(regression)
	4 -- nu-SVR		(regression)
-t kernel_type : set type of kernel function (default 2)
	0 -- linear: u'*v
	1 -- polynomial: (gamma*u'*v + coef0)^degree
	2 -- radial basis function: exp(-gamma*|u-v|^2)
	3 -- sigmoid: tanh(gamma*u'*v + coef0)
	4 -- precomputed kernel (kernel values in training_instance_matrix)
-d degree : set degree in kernel function (default 3)
[...]
```

#### Two-class SVM

The helper function svmTrain ...

```matlab
% seed the random number generator to get reproducible results
rand('seed', 101);
X = rand(200, 2);       % create a random data set
y = X(:, 1) < X(:, 2);  % create the class labels
M = svmTrain(X, y);     % training of a SVM

% create another data set for classification
P = rand(20, 2); 
% predict the class labels for this data set
r = svmPredict(P, M);

% visualize the predicted classes
r = r + 2;
visualizeInstances([X; P], [y; r]);

% plot the decision boundary
[w, b] = svmDecisionBoundary(M);
% b + w(1) + w(2) = 0 is the decision boundary
% y = x(2) = = (-b - w(1) * x(1)) / w(2)
axis([0 1 0 1]);
plot([0 1], [-b / w(2), (-b - w(1)) / w(2)]);
```

The following plot is generated:

![plot for support vector machine](https://github.com/daniel-e/machine_learning/blob/plots/tools/octave/plot_svm.png)

