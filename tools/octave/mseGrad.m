% -- [grad] = mseGrad(X, hvals, y)
%
% Computes the gradient.
%
%  X      The design matrix.
%
%  hvals  A vector of predicted values, for each example one value.
%
%  y      A vector of targe values, for each example one value.
%
% RETURNS
%
%  J     The cost.
function grad = mseGrad(X, hvals, y)
	grad = X' * (hvals - y) / length(y);
end

%!test
%! X = [0, 0.29, 0.41; 0.79, 0.97, 0.47; 0.58, 0.53, 0.64; 0.55, 0.41, 0.08];
%! hvals = [0.8; 0.7; 0.6; 0.5];
%! y = [1; 0; 1; 2];
%! assert (mseGrad(X, hvals, y), [-0.126; -0.0515; -0.03225], .000001)
