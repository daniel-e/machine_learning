#!/usr/bin/env python

import sys, Image, numpy

if len(sys.argv) != 2:
	print >> sys.stderr, "usage:", sys.argv[0], "<img>"
	sys.exit(1)

fname = sys.argv[1]
img = Image.open(fname).convert('L')
for row in numpy.array(img):
	print " ".join([str(i) for i in row])
