function [X, y] = loadWineData(dataset)
	data = dlmread(dataset, ';');
	X = data(2:end, 1:11);
	y = data(2:end, 12);
end
