clc;
close all;

% Load images
baboon = imread('baboon.tif');
hidden_img = imread('Barbara.bmp');

% Embed hidden image using LSB method
lsb_baboons = hide_image(baboon, hidden_img, 1);

% Embed watermark using Yeung-Mintzer method
key = 123;
ymw_baboons_watermarked = yeung_mintzer_watermark(baboon, hidden_img, key);

% Load peppers image and manipulate
peppers = imread('peppers.tif');
peppers_bottom = peppers(ceil(size(peppers, 1) / 2):end, :, :);
peppers_bottom = peppers_bottom(1:size(lsb_baboons, 1) / 2, :, :);

% Attack on LSB watermarked image
baboon_lsb_attack = lsb_baboons;
baboon_lsb_attack(1:ceil(size(lsb_baboons, 1) / 2), :, :) = peppers_bottom;

% Extract watermarks from attacked images
watermark_lsb_attack = extract_LSB_watermark(baboon_lsb_attack);
watermark_yeung_attack = yeung_mintzer_extract(ymw_baboons_watermarked, key);

% Display extracted watermarks
figure(1);
imshow(watermark_lsb_attack, []);
title('Extracted Watermark (LSB Watermarked Image) after Attack');

figure(2);
imshow(watermark_yeung_attack);
title('Extracted Watermark (Yeung-Mintzer Watermarked Image) after Attack');

"This script demonstrates the robustness of two watermarking techniques (LSB and Yeung-Mintzer) by applying 
an image manipulation attack and then extracting the watermarks to see how they hold up. Ensure you have 
the hide_image, yeung_mintzer_watermark, extract_LSB_watermark, and yeung_mintzer_extract functions defined 
in your MATLAB environment."


