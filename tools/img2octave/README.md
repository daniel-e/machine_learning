Tool to convert an image to a matrix which can be viewed in Octave.

Usage:

./togray.py tree.png > tree.txt

in Octave:

load tree.txt;
colormap(gray);
imagesc(tree)

