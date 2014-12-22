#!/usr/bin/env python

import sys, Image, numpy
import scipy.io

if len(sys.argv) != 3:
	print >> sys.stderr, "usage:", sys.argv[0], "<img> <output>"
	sys.exit(1)

fname = sys.argv[1]
out = sys.argv[2]
img = Image.open(fname).convert('L')
img = numpy.array(img)
scipy.io.savemat(out, {"image": img}, oned_as = 'column', do_compression = True)

