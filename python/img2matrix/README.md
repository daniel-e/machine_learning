This directory contains a Python script `img2graymatrix.py` which converts an image to grayscale and stores the grayscale image as a matrix in a file that can be read with MATLAB and Octave. The output value for each pixel is in the range [0,255].

If the image has width `w` and height `h` the output is a `h x w` matrix.

Example usage:

```./img2graymatrix.py cat.png cat.mat```

In Octave the image can be loaded and displayed with the following commands:

```load('cat.mat'), colormap(gray), imagesc(cat);```

