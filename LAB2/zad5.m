img = imread('plaza1.png');
img_double = double(img);
all_pixels = img_double(:);

sorted_pixels = sort(all_pixels);

n_pixels = numel(sorted_pixels);
we_min_prime = sorted_pixels(round(0.10 * n_pixels));
we_max_prime = sorted_pixels(round(0.90 * n_pixels));

img_scaled = (img_double - we_min_prime) * 255 / (we_max_prime - we_min_prime);

img_scaled(img_scaled < 0) = 0;
img_scaled(img_scaled > 255) = 255;

img_scaled = uint8(img_scaled);

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
title('R');

subplot(2, 2, 3);
hist(green_channel_scaled, 100);
title('G');

subplot(2, 2, 4);
hist(blue_channel_scaled, 100);
title('B');

