%zad1
obraz = imread('rzeczka.jpg');
img = double(obraz);

gamma = 1.5;
img_gamma = 255 * (img/255) .^ (1/gamma);
img_gamma = uint8(img_gamma);

function output = porownanie_v_PS(img1,img2)
  output = abs(img2-im1);
end

function output = porownanie_v_2(img1,img2)
  srodek = 127.5;
  output = img2-im1 + srodek;
  output = min(max(output,0),255);
end

function output = porownanie_v_PS_mnoznik(img1,img2,mnoznik)
  output = mnoznik * abs(img2-img1);
  output = min(max(output,0),255);
 end
 
function output = porownanie_v_2_mnoznik(img1,img2,mnoznik)
  srodek = 127.5;
  output = mnoznik * (img2-img1) + srodek;
  output = min(max(output,0),255);
end

porownanie_PS_4 = porownanie_v_PS_mnoznik(img,img_gamma,4);
porownanie_v2_3 = porownanie_v_2_mnoznik(img,img_gamma,3);

subplot(2,2,1), imshow(uint8(img)),title ('org');
subplot(2,2,2), imshow(uint8(img_gamma)),title ('Gamma 1.5');
subplot(2,2,3), imshow(uint8(porownanie_PS_4)),title ('Porównanie v.PS *4');
subplot(2,2,4), imshow(uint8(porownanie_v2_3)),title ('Porównanie v.2 *3');