1;

addpath('..');     % for the sigmoid function
rand('seed', 23);  % to get reproducable results

% Create a dataset where X is a random 50x2 matrix where an entry is
% either 0 or 1.
% The target values are the XOR of the columns of X.
X = unidrnd(2, 50, 2) - 1;
y = xor(X(:, 1), X(:, 2));

% Initialize a neural network with 3 layers.
% Input layer has 2 neurons, hidden layer has 4 neurons, output layer
% has one neuron.
net = NNinit([2, 4, 1]);

% Train the neural network.
options = optimset('MaxIter', 50, 'GradObj', 'on');
[params, cost] = fminunc(@(t) NNcost(net, X, y, t), net.init, options);

% Set the trained parameters.
net = NNset(net, params);

% Predict all possible inputs.
NNpredict(net, [1; 0])
NNpredict(net, [0; 1])
NNpredict(net, [1; 1])
NNpredict(net, [0; 0])
