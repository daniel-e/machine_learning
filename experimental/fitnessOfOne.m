% Input is a vector of (x,y) coordinates.
function f = fitnessOfOne(X)
	Y = [X; X(1, :)]; % append start point to the end
	Y
	f = sum(arrayfun(@(i) sqrt(sumsq(Y(i,:) - Y(i - 1,:))), 2:size(Y, 1)))
end
