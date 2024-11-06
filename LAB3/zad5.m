gamma = 1.5;
zakres = 255;

LUT_gamma = uint8(round(zakres * ((0:zakres) / zakres).^(1 / gamma)));

function wyjscie = LUT_zastosuj(wejscie, LUT)
    wejscie_przyciete = round(max(0, min(255, wejscie)));
    wyjscie = LUT(wejscie_przyciete + 1);
end


obraz = imread('rzeczka2.png');
obraz = double(obraz);

obraz_przeksztalcony = LUT_zastosuj(obraz, LUT_gamma);

subplot(1, 2, 1);
imshow(uint8(obraz));
title('Oryginalny obrazek');
subplot(1, 2, 2);
imshow(uint8(obraz_przeksztalcony));
title('LUT z gamma 1.5');

figure;
plot(0:zakres, LUT_gamma, '-b');
xlabel('Wartość wejściowa');
ylabel('Wartość wyjściowa po korekcji gamma 1.5');
title('Tablica LUT dla gamma 1.5');
grid on;

