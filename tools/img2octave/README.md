This directory contains a Python script `togray.py` which converts an image to grayscale and outputs the pixel values as a matrix to stdout which can be loaded with Octave.

Usage:

```./togray.py tree.png > tree.txt```

in Octave the image can be loaded and displayed with the following commands:

```load('tree.txt'), colormap(gray), imagesc(tree);```

