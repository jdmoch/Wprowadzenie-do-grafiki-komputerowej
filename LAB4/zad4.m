%zad4
img_uint8 = imread('rzeczka.jpg');
obraz = double(img_uint8);

function wynik = porownanie_v_PS_z_mnoznikiem(obraz_stary, obraz_nowy, mnoznik)
    roznica = abs(obraz_nowy - obraz_stary);
    wynik = przytnij_zakres(mnoznik * roznica);
end
function wynik = porownanie_v_2_z_mnoznikiem(obraz_stary, obraz_nowy, mnoznik)
    wynik = przytnij_zakres((obraz_nowy - obraz_stary) * mnoznik + 127.5);
end
function wynik = przytnij_zakres(wejscie)
    wejscie(wejscie < 0) = 0;
    wejscie(wejscie > 255) = 255;
    wynik = wejscie;
end
R = obraz(:, :, 1);
G = obraz(:, :, 2);
B = obraz(:, :, 3);

Y = 0 + 0.299 * R + 0.587 * G + 0.114 * B;
Cb = 128 - 0.168736 * R - 0.331264 * G + 0.5 * B;
Cr = 128 + 0.5 * R - 0.418688 * G - 0.081312 * B;

R_przywrocone = Y + 1.402 * (Cr - 128);
G_przywrocone = Y - 0.344136 * (Cb - 128) - 0.714136 * (Cr - 128);
B_przywrocone = Y + 1.772 * (Cb - 128);

obraz_przywrocony = cat(3, R_przywrocone, G_przywrocone, B_przywrocone);

wynik_v_PS_z_mnoznikiem = porownanie_v_PS_z_mnoznikiem(obraz, obraz_przywrocony, 1000000);
wynik_v_2_z_mnoznikiem = porownanie_v_2_z_mnoznikiem(obraz, obraz_przywrocony, 1000000);

roznica_modulu = max(abs(obraz(:) - obraz_przywrocony(:)));

fprintf('Maksymalny modu³ ró¿nicy: %f\n', roznica_modulu);

subplot(1, 2, 1), imshow(wynik_v_PS_z_mnoznikiem/255), title('porownanie v.PS * 1000000');
subplot(1, 2, 2), imshow(wynik_v_2_z_mnoznikiem/255), title('porownanie v.2 * 1000000');