function [w, b] = svmDecisionBoundary(M)
	% http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex7/ex7.html
	% TODO
	w = M.SVs' * M.sv_coef;
	b = -M.rho;
end
