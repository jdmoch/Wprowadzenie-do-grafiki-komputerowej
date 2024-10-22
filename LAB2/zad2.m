img = imread('plaza1.png');

all_pixels = reshape(img, [], 1);
red_channel = reshape(img(:,:,1), [], 1);
green_channel = reshape(img(:,:,2), [], 1);
blue_channel = reshape(img(:,:,3), [], 1);

figure;
subplot(2, 2, 1);
hist(all_pixels, 100);
title('R+G+B');

subplot(2, 2, 2);
hist(red_channel, 100);
title('R');

subplot(2, 2, 3);
hist(green_channel, 100);
title('G');

subplot(2, 2, 4);
hist(blue_channel, 100);
title('B');

