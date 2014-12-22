#!/usr/bin/env python

import os, struct, numpy, gzip, sys
from array import array
import scipy.io
import numpy as np

DEFAULT_OUTPUT = "mnist.mat"

def load_mnist(fnimg, fnlabel):
	f = gzip.open(fnlabel, 'rb')
	f.read(8)
	labels = array("b", f.read())

	f = gzip.open(fnimg, 'rb')
	magic_nr, N, rows, cols = struct.unpack(">IIII", f.read(16))
	img = array("B", f.read())

	images = np.zeros((N, rows * cols))
	for i in range(N):
		data = np.array(img[i * rows * cols:(i + 1) * rows * cols])
		data = data.reshape((rows, cols))
		data = data.reshape((1, rows * cols), order = 'F')
		images[i] = data

	return images, labels


if __name__ == "__main__":
	trainingX, trainingY = load_mnist("train-images-idx3-ubyte.gz", "train-labels-idx1-ubyte.gz")
	testingX, testingY = load_mnist("t10k-images-idx3-ubyte.gz", "t10k-labels-idx1-ubyte.gz")

	output = DEFAULT_OUTPUT
	if len(sys.argv) > 1:
		output = sys.argv[1]

	scipy.io.savemat(output, 
		{"trainingX": trainingX, "trainingY": trainingY,
		 "testingX": testingX, "testingY": testingY}, 
		oned_as = 'column',
		do_compression = True)
