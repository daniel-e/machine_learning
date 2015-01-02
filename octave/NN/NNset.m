function r = NNset(net, params)
	r = net;
	n1 = size(net.theta1);
	n2 = size(net.theta2);
	r.theta1 = reshape(params(1:prod(n1)), n1);
	r.theta2 = reshape(params(prod(n1) + 1:prod(n1) + prod(n2)), n2);
end
