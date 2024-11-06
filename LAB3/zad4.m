LUT = min(255, max(0, (0:255) + 50));
function wyjscie = LUT_zastosuj(wejscie, LUT)
    wejscie_przyciete = round(max(0, min(255, wejscie)));
    wyjscie = LUT(wejscie_przyciete + 1);
end

obraz = imread('rzeczka2.png');

obraz = double(obraz);

obraz_przeksztalcony = LUT_zastosuj(obraz, LUT);

figure;
subplot(1,2,1);
imshow(uint8(obraz));
title('org')
subplot(1,2,2);
imshow(uint8(obraz_przeksztalcony));
title('LUT z jasn +50');


