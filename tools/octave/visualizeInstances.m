% -- [] = visualizeInstances(X, y)
%
% Visualizes the instances of matrix X.
%
%  X     is the m x 2 dimensional matrix of m examples each with
%        2 features.
%
%  y     m dimensional column vector of actual values for each example
%        either 0 or 1.
%
function visualizeInstances(X, y)
	clf;
	hold("on");
	plot(X(y == 1, 1), X(y == 1, 2), "x", "markersize", 8, "marker", "o", "markeredgecolor", "black", "markerfacecolor", "yellow");
	plot(X(y == 0, 1), X(y == 0, 2), "x", "markersize", 8, "marker", "d", "markeredgecolor", "black", "markerfacecolor", "green");
end
