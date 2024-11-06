wspKontrastu_plus = 60;
wspKontrastu_minus = -60;
zakres = 255;
srodek = 127.5;
wspMn_plus = ((zakres + wspKontrastu_plus) / zakres) ^ 2;
wspMn_minus = ((zakres + wspKontrastu_minus) / zakres) ^ 2;

LUT_org = uint8(0:zakres);
LUT_plus = uint8(round(min(255, max(0, srodek + ((0:zakres) - srodek) * wspMn_plus))));
LUT_minus = uint8(round(min(255, max(0, srodek + ((0:zakres) - srodek) * wspMn_minus))));

function wyjscie = LUT_zastosuj(wejscie, LUT)
    wejscie_przyciete = round(max(0, min(255, wejscie)));
    wyjscie = LUT(wejscie_przyciete + 1);
end

obraz = imread('rzeczka2.png');
obraz = double(obraz);

obraz_kontrast_plus = LUT_zastosuj(obraz, LUT_plus);
obraz_kontrast_minus = LUT_zastosuj(obraz, LUT_minus);

subplot(1, 3, 1);
imshow(uint8(obraz_kontrast_minus));
title('Kontrast -60');

subplot(1, 3, 2);
imshow(uint8(obraz));
title('org');

subplot(1, 3, 3);
imshow(uint8(obraz_kontrast_plus));
title('Kontrast +60');

figure;
plot(0:zakres, LUT_plus, '-b', 'DisplayName', 'Kontrast +60');
hold on;
plot(0:zakres, LUT_org, '-g', 'DisplayName', 'org');
plot(0:zakres, LUT_minus, '-r', 'DisplayName', 'Kontrast -60');
xlabel('Wartość wejściowa');
ylabel('Wartość wyjściowa');
title('Tablice LUT dla kontrastu +60 i -60');
legend;
grid on;
hold off;

