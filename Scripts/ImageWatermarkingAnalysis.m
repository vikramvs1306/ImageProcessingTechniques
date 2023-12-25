% Load images
peppers = imread('peppers.tif');
baboon = imread('baboon.tif');
watermark = imread('Barbara.bmp');

% Extract the most significant bit plane of the watermark
msb_watermark = bitget(watermark, 8);

% Embed watermark into peppers image
key = 123;
peppers_watermarked = yeung_mintzer_watermark(peppers, msb_watermark, key);

% Embed watermark into baboon image
baboon_watermarked = yeung_mintzer_watermark(baboon, msb_watermark, key);

% Display watermarked images
figure;
subplot(1, 2, 1);
imshow(peppers_watermarked);
title('Peppers Watermarked');
subplot(1, 2, 2);
imshow(baboon_watermarked);
title('Baboon Watermarked');

% Extract the LSB of watermarked images
lsb_pepperswmkd = bit_plane(peppers_watermarked,1);
lsb_baboonwmkd = bit_plane(baboon_watermarked,1);

% Calculate PSNR values
psnr_value = psnr(peppers, peppers_watermarked);
psnr_value1 = psnr(baboon, baboon_watermarked);

% Print PSNR values
fprintf('Peppers PSNR: %f dB\n', psnr_value);
fprintf('Baboon PSNR: %f dB\n', psnr_value1);
