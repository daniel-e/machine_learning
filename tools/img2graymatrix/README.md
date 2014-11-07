This directory contains a Python script `img2graymatrix.py` which converts an image to grayscale and outputs the pixel values as a matrix to stdout which can be loaded in Octave vie the `load` command. The output value for each pixel is in the range [0,255].

Example usage:

```./img2graymatrix.py tree.png > tree.txt```

In Octave the image can be loaded and displayed with the following commands:

```load('tree.txt'), colormap(gray), imagesc(tree);```

