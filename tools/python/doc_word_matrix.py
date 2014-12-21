import sys

def matrix(filename, fout):
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
	for d in docs:
		v = [0] * len(mapping)
		for w in d:
			v[w] += 1
		print >> fout, " ".join([str(val) for val in v])

if __name__ == "__main__":
	matrix("testdata.txt", sys.stdout);
