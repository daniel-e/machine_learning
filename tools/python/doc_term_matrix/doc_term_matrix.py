import sys

import numpy as np
import scipy.io

def doc_term_matrix(filename):
	mapping = {}
	docs = []
	for i in open(filename):
		words = i.strip().split()
		d = []
		for w in words:
			if not w in mapping:
				mapping[w] = len(mapping)
			d.append(mapping[w])
		docs.append(d)
	m = np.zeros((len(docs), len(mapping)))
	for i, d in enumerate(docs):
		v = np.array([0] * len(mapping))
		for w in d:
			v[w] += 1
		m[i] = v
	return m

def save_matrix_as_matlab(fname, name, matrix):
	scipy.io.savemat(fname, {name: matrix}, oned_as = 'column', do_compression = True)


if __name__ == "__main__":
	m = doc_term_matrix("example.txt");
	print m
	save_matrix_as_matlab("example.mat", "docterm", m);
