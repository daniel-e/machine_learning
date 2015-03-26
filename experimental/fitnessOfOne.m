% -- [f] = fitnessOfOne(X)
%
% Computes the fitness of one individual.
%
%  X   Matrix where each row denotes the (x,y) coordinates of an individual.
%
% RETURNS
%
%  f   The length of the path from the first to the last point and back
%      to the first point.
function f = fitnessOfOne(X)
	Y = [X; X(1, :)]; % append start point to the end
	f = 1.0 / sum(arrayfun(@(i) sqrt(sumsq(Y(i, :) - Y(i - 1, :))), 2:size(Y, 1)));
end

% In this test we have the path (1,2) -> (2,7) -> (2,8) -> (1,2)
% The length of the path is:
% sqrt(1+25) + sqrt(1) + sqrt(1+36) = 12.182

%!test
%! X = [1 2; 2 7; 2 8];
%! f = fitnessOfOne(X);
%! assert(f, 1.0 / 12.18178204, .00000001);
