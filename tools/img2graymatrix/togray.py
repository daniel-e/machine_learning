#!/usr/bin/env python

import sys, Image, numpy

for fname in sys.argv[1:]:
	print >> sys.stderr, fname
	for row in numpy.array(Image.open(fname).convert('L')):
		print " ".join([str(i) for i in row])
