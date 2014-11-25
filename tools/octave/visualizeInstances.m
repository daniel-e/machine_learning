% -- [] = visualizeInstances(X, y)
%
% Visualizes the instances of matrix X belonging to at most five classes.
%
%  X     is the m x 2 dimensional matrix of m examples each with
%        2 features.
%
%  y     m dimensional column vector of actual values for each example
%        either in {0,1,2,3,4}.
%
function visualizeInstances(X, y)
	clf;
	hold("on");
	plot(X(y == 0, 1), X(y == 0, 2), "x", "markersize", 8, "marker", "d", "markeredgecolor", "black", "markerfacecolor", "green");
	plot(X(y == 1, 1), X(y == 1, 2), "x", "markersize", 8, "marker", "o", "markeredgecolor", "black", "markerfacecolor", "yellow");
	plot(X(y == 2, 1), X(y == 2, 2), "x", "markersize", 8, "marker", "^", "markeredgecolor", "black", "markerfacecolor", "magenta");
	plot(X(y == 3, 1), X(y == 3, 2), "x", "markersize", 8, "marker", "s", "markeredgecolor", "black", "markerfacecolor", "red");
	plot(X(y == 4, 1), X(y == 4, 2), "x", "markersize", 8, "marker", "v", "markeredgecolor", "black", "markerfacecolor", "blue");
end
