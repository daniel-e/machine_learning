function net = NNinit(layers)
	net.layers = layers;
	net.theta1 = rand(layers(2), layers(1) + 1);
	net.theta2 = rand(layers(3), layers(2) + 1);
	net.init = [net.theta1(:); net.theta2(:)];
end
