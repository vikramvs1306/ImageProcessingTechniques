function [stego] = hide_image(image, hidden_image, N)
    oi1 = double(image);
    hi = double(hidden_image);

    hishift = bitshift(hi, -(8 - N));
    showhi = uint8(hishift);
    showhi = bitshift(showhi, 8 - N);

    coverzero = oi1;
    for i = 1:N
        coverzero = bitset(coverzero, i, 0);
    end

    coverzero1 = imresize(coverzero, [512, 512]);
    coverzero1 = double(coverzero1);
    stego = uint8(coverzero1 + hishift);

    figure,
    subplot(1, 2, 1); imshow(showhi); title('Embed Image to Hide');
    subplot(1, 2, 2); imshow(stego); title('Stego Image');
    imwrite(stego, 'modified_image.bmp');
end

% Script to call the function
clc;
close all;
peppers = imread('peppers.tif');
hidden_image = imread('Barbara.bmp');
hide1 = hide_image(peppers, hidden_image, 4);

clc;
close all;
baboon = imread('baboon.tif');
hidden_image = imread('Barbara.bmp');
hide2 = hide_image(baboon, hidden_image, 5);


"4 bit planes of Barabara can be embedded before noticing the distortion. 
5 bit planes of Barbara can be embedded before noticing the distortion.
5 bit planes of Barbara can be embed in Pepper before you notice the 
hidden image.
6 bit planes of Barbara can be embed in Baboon before you notice the 
hidden image.
The number of bit planes you can embed is different because the details of 
the image are different and it depends on the contrast and complexity of 
the hidden image. "
