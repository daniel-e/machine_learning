1;

npop = 2;  % size of initial population

load points;
X = [x y];
X = X(1:4, :);
n = size(X, 1);
P = createPopulation(npop, n);

% P = initial population
%     each row represents an individual and contains a permuation of X
% n = number of cities
% X = (x,y) coordinates for each city; one city per row

more off;
disp("");
disp("number of cities"), disp(n);
disp("number of permutations"), disp(factorial(n));

X
P
f = fitnessOfAll(@(i) fitnessOfOne(X(i, :)), P)

