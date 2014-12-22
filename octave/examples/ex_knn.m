1;

% This example shows how to classify handwritten digits with a simple
% kNN classifier.
 
addpath('..')

more off;
disp('Loading MNIST dataset ...');
load('../../data/mnist/mnist.mat');

n = 50;
printf('classifying %d test examples...\n', n);
X = testingX(1:n,:);
y = testingY(1:n,:);
k = 5;
[accuracy, predictions] = testClassifier(@(p) knn(trainingX, trainingY, p, k), X, y);

printf('accuracy = %f\n', accuracy)

