I = imread('inpainting/9_edge.png');
%imshow(I)
bw = im2bw(I, graythresh(I));
imshow(bw);
%bw2 = imfill(bw, 'holes');
%imshow(bw2)
L = bwlabel(bw);