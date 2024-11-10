%zad5 


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