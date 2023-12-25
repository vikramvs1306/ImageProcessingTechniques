clc;
close all;

% Load and process images
baboon = imread('baboon.tif');
hidden_img = imread('Barbara.bmp');
lsb_baboons = hide_image(baboon, hidden_img, 1);
key = 123;
ymw_baboons_watermarked = yeung_mintzer_watermark(baboon, hidden_img, key);

% Load additional image
peppers = imread('peppers.tif');

% Get dimensions and perform image manipulation
[height, width] = size(lsb_baboons);
half_height = round(height / 2);
lsb_baboons(1:half_height,:,:) = peppers(half_height+1:end,:,:);
ymw_baboons_watermarked(1:half_height,:,:) = peppers(half_height+1:end,:,:);

% Extract watermarks
watermark_lsb = extract_LSB_watermark(lsb_baboons);
watermark_yeung = yeung_mintzer_extract(ymw_baboons_watermarked, key);

% Display watermarks
figure;
subplot(1, 2, 1);
imshow(watermark_lsb, []);
title('LSB Watermark');
subplot(1, 2, 2);
imshow(watermark_yeung);
title('Yeung-Mintzer Watermark');

"This script requires the hide_image, yeung_mintzer_watermark, extract_LSB_watermark, and yeung_mintzer_extract functions to be defined in your MATLAB environment. 
It embeds watermarks using both LSB and Yeung-Mintzer methods, modifies the images, and then extracts the watermarks for comparison."









