clc;
close all;

% Load images
peppers = imread('peppers.tif');
baboon = imread('baboon.tif');
hidden_img = imread('Barbara.bmp');

% Embed the hidden bit plane in the LSB of both images
stego1 = hide_image(peppers, hidden_img, 1);
stego2 = hide_image(baboon, hidden_img, 1);

% Calculate the PSNR between original and stego images
psnrp = psnr(peppers, stego1);
psnrb = psnr(baboon, stego2);

% Display the PSNR values
disp(['PSNR for peppers.tif: ', num2str(psnrp)])
disp(['PSNR for baboon.tif: ', num2str(psnrb)])

% Display bit plane images
bitplane_imgs(stego1);
bitplane_imgs(stego2);


"The PSNR between the original version of Peppers image and its 
watermark using LSB embedding function is 47.0891 dB.
The PSNR between the original version of Baboon image and its 
watermark using LSB embedding function is 47.0601 dB.
These PSNR values are lower than the PSNR values obtained using Yeung 
Mintzer algorithm. The reason is LSB algorithm will change the LSB’s of 
original image to embed the watermark, these will lead to distortions in 
image. Yeung Mintzer uses a quantization step to embed the watermark, 
which distorts the image less."
