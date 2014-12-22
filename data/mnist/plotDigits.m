% plotDigits(X, rows, cols)
%
% Plots rows * cols MNIST digits from the matrix X.
%
%  X     The matrix which contains a MNIST digit at each row.
%
%  rows  The number of rows.
%
%  cols  The number of columns.
function plotDigits(X, rows, cols)
	Y = zeros(rows * 28, cols * 28);
	i = 1;
	for y = 1:rows
		for x = 1:cols
			px = (x - 1) * 28 + 1;
			py = (y - 1) * 28 + 1;
			Y(py:py + 27, px:px + 27) = reshape(X(i, :), 28, 28);
			i = i + 1;
		end
	end
	colormap(gray());
	imagesc(Y);
end

