% -- [acc, pred] = testClassifier(classifier, X, y)
%
% Uses the given classifier to classify all testing examples in X.
%
%  X     An m times n matrix of m examples and n features.
%
%  y     A column vector with the known target values for each example.
%
% RETURNS
%
%  acc   The accuracy.
%
%  pred  A column vector with the predicted label for each example.
function [accuracy, predictions] = testClassifier(classifier, X, y)

	labels = unique(y);
	counts = histc(y, labels);
	s = "labels: ";
	for i = 1:length(labels)
		s = [s, num2str(labels(i)), "=", num2str(counts(i)), "x "];
	end
	printf("%s\n\n", s);

	m = size(X, 1); % number of test examples
	t = zeros(m, 1);
	for i = 1:m
		t(i) = classifier(X(i, :)');
		s = "correct";
		if t(i) != y(i)
			s = "wrong";
		end
		printf("-> pattern %d of %d: %s (t=%d, y=%d)\n", i, m, s, t(i), y(i)), fflush(stdout);
	end
	accuracy = sum(t == y) / m;
	predictions = t;
end
