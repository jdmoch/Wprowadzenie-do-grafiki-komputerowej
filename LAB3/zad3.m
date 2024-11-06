%zad3
function zad3()
    img = imread('rzeczka2.png');
    img_double = double(img);

    wspJasnosci_neg = -50;
    wspJasnosci_zero = 0;
    wspJasnosci_pos = 50;

    img_neg = ZmienJasnosc(img_double, wspJasnosci_neg);
    img_zero = ZmienJasnosc(img_double, wspJasnosci_zero);
    img_pos = ZmienJasnosc(img_double, wspJasnosci_pos);

    figure;

    subplot(1, 3, 1);
    imshow(uint8(img_neg));
    title('Jasność -50');

    subplot(1, 3, 2);
    imshow(uint8(img_zero));
    title('Oryginalny');

    subplot(1, 3, 3);
    imshow(uint8(img_pos));
    title('Jasność +50');
end

function output = ZmienJasnosc(input, wspJasnosci)
    output = input + wspJasnosci;
    output = PrzytnijZakres(output);
end

function output = PrzytnijZakres(input)
    output = zeros(size(input));
    for i = 1:numel(input)
        if input(i) < 0
            output(i) = 0;
        elseif input(i) > 255
            output(i) = 255;
        else
            output(i) = input(i);
        end
    end
end
