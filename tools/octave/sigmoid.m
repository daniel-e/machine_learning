% -- [g] = sigmoid(z)
%
% Computes the sigmoid function of the scalar/vector/matrix z.
%
%  z     the scalar, vector or matrix for which the sigmoid function
%        should be computed.
%
% RETURNS
%
%  g     The value of the sigmoid function.
function g = sigmoid(z)
	g = 1 ./ (1 + exp(-z));
end

%!test
%! z = [1 2; 3 4];
%! r = sigmoid(z);
%! assert (r, [0.73106, 0.88080; 0.95257, 0.98201], 0.00001)
