img = imread('plaza1.png');
img_double = double(img);

red_channel = img_double(:,:,1);
red_min = min(red_channel(:));
red_max = max(red_channel(:));
red_scaled = (red_channel - red_min) * 255 / (red_max - red_min);

green_channel = img_double(:,:,2);
green_min = min(green_channel(:));
green_max = max(green_channel(:));
green_scaled = (green_channel - green_min) * 255 / (green_max - green_min);

blue_channel = img_double(:,:,3);
blue_min = min(blue_channel(:));
blue_max = max(blue_channel(:));
blue_scaled = (blue_channel - blue_min) * 255 / (blue_max - blue_min);

img_scaled = cat(3, uint8(red_scaled), uint8(green_scaled), uint8(blue_scaled));

figure;
subplot(1, 2, 1);
imshow(img);
title('org');

subplot(1, 2, 2);
imshow(img_scaled);
title('zmieniony');

all_pixels_scaled = reshape(img_scaled, [], 1);
red_channel_scaled = reshape(img_scaled(:,:,1), [], 1);
green_channel_scaled = reshape(img_scaled(:,:,2), [], 1);
blue_channel_scaled = reshape(img_scaled(:,:,3), [], 1);

figure;
subplot(2, 2, 1);
hist(all_pixels_scaled, 100);
title('R+G+B');

subplot(2, 2, 2);
hist(red_channel_scaled, 100);
title('R)');

subplot(2, 2, 3);
hist(green_channel_scaled, 100);
title('G');

subplot(2, 2, 4);
hist(blue_channel_scaled, 100);
title('B');

