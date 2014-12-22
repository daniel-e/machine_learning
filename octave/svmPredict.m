function [y] = svmPredict(X, M)
	% TODO
	z = double(zeros(size(X, 1), 1));
	y = svmpredict(z, double(X), M, "-q");
end
