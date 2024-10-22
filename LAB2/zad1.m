%zad1
img = imread('plaza1.png');
red_channel = img(:,:,1);
blue_channel = img(:,:,3);
img(:,:,1) = blue_channel;
img(:,:,3) = red_channel;
imshow(img);
