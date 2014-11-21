% -- [T] = tfidf(X)
%
% Computes the tf-idf (term frequency-inverse document frequency) of the
% given document-term matrix.
%
%  X     The document-term matrix which stores the frequency of terms
%        for documents of a document collection. Rows correspond to
%        documents and columns correspond to terms.
%
% RETURNS
%
%  T     Matrix of tf-idf values.
function T = tfidf(X)
	% n = number of documents
	n = size(X, 1);
	T = bsxfun(@times, bsxfun(@rdivide, X, max(X, [], 2)), log(n ./ sum(X > 0)));
end

%!test
%! X = [1,2,3,0; 3,1,0,1; 4,5,2,0];
%! T = tfidf(X);
%! assert (T, [0,0,log(3/2),0; 0,0,0,log(3)/3; 0,0,2/5*log(3/2),0], 1e-4);

