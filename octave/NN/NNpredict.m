function h = NNpredict(net, x)
	[a1, a2, a3] = NNff(net.theta1, net.theta2, x);
	h = a3;
end
