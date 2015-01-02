function [J, grad] = NNcost(net, X, y, params)

	m = size(X, 1);
	n1 = size(net.theta1);
	n2 = size(net.theta2);
	theta1 = reshape(params(1:prod(n1)), n1);
	theta2 = reshape(params(prod(n1) + 1:prod(n1) + prod(n2)), n2);
	
	grad1 = zeros(size(theta1));
	grad2 = zeros(size(theta2));
	J = 0;

	for i = 1:m
		% feed forward
		[a1, a2, a3] = NNff(theta1, theta2, X(i, :)');
		% error
		J += sumsq(a3 - y(i));
		% back propagation
		d3 = (a3 - y(i)) .* (a3 .* (1.0 - a3));
		d2 = (theta2' * d3)(2:end, :) .* (a2 .* (1.0 - a2));
		grad2 += d3 * [1, a2'];
		grad1 += d2 * [1, a1'];
	end

	J /= 2.0 * m;
	grad = [grad1(:); grad2(:)] / m;
end
