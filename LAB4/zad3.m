%zad3
img_uint8 = imread('rzeczka.jpg');
obraz = double(img_uint8);

R = obraz(:, :, 1);
G = obraz(:, :, 2);
B = obraz(:, :, 3);

Y = 0 + 0.299 * R + 0.587 * G + 0.114 * B;
Cb = 128 - 0.168736 * R - 0.331264 * G + 0.5 * B;
Cr = 128 + 0.5 * R - 0.418688 * G - 0.081312 * B;

subplot(2, 2, 1), imshow(obraz / 255), title('RGB');
subplot(2, 2, 2), imshow(Y/255), title('Y');
subplot(2, 2, 3), imshow(Cb/255), title('Cb');
subplot(2, 2, 4), imshow(Cr/255), title('Cr');