function [a1, a2, a3] = NNff(theta1, theta2, x)
	a1 = x;
	a2 = sigmoid(theta1 * [1; a1]);
	a3 = sigmoid(theta2 * [1; a2]);
end
