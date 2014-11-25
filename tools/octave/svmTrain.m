% -- [M] = svmTrain(X, y)
% -- [M] = svmTrain(X, y, C)
% -- [M] = svmTrain(X, y, C, gamma)
%
% This function uses LIBSVM to train a model.
% 
%  X     An m times n matrix with m examples each with n features.
%
%  y     A row vector of the class labels of the examples.
% TODO
function [M] = svmTrain(X, y, C = 10000, gamma = 0.001)
	% LIBSVM expects:
	% -s 0 : C-SVC
	% -t 2 : radial basis function
	% -c val : cost C
	% -g val : gamma
	% an m by 1 vector of training labels
	% an m by n matrix of m training instances with n features
	params = ["-q -s 0 -t 2 -c " num2str(C) " -g " num2str(gamma)];
	M = svmtrain(double(y), double(X), params);
end
