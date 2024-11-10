%zad2
img = imread('rzeczka.jpg');
img = double(img);

function szarosc = SzaroscSrednia(img)
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  szarosc = (r+g+b) /3;
end
function szarosc = SzaroscSzary(img)
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  szarosc = 0.2126 * r + 0.7152 * g + 0.0722 * b;
end

szarosc_srednia = SzaroscSrednia(img);
szarosc_szary = SzaroscSzary(img);

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

porownanie_PS_4 = porownanie_v_PS_mnoznik(szarosc_szary,szarosc_srednia,4);
porownanie_v2_3 = porownanie_v_2_mnoznik(szarosc_szary,szarosc_srednia,3);

subplot(2,2,1), imshow(uint8(szarosc_szary)), title('Szary');
subplot(2,2,2), imshow(uint8(szarosc_srednia)), title('Œrednia');
subplot(2,2,3), imshow(uint8(porownanie_PS_4)), title('Porównianie v.PS *4');
subplot(2,2,4), imshow(uint8(porownanie_v2_3)), title('Porównanie v.2 *3');