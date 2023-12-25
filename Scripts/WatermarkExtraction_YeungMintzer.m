function [watermark] = yeung_mintzer_extract(image, key)
    % Convert image to double precision
    image = im2double(image);

    % Generate lookup table using key
    rng(key);
    lut = double(rand(256, 2) > 0.5);

    % Flatten image
    flat_image = reshape(image, 1, []);

    % Extract watermark from image
    watermark = zeros(size(flat_image));
    for i = 1:length(flat_image)
        pixel_value = round(max(min(flat_image(i) * 255, 255), 0));
        watermark_bit = lut(pixel_value + 1, 1);
        watermark(i) = watermark_bit;
    end

    % Reshape watermark back to original dimensions
    watermark = im2double(reshape(watermark, size(image)));

    % Display watermarked image and watermark
    figure;
    subplot(1, 2, 1);
    imshow(image); title('Watermarked image');
    subplot(1, 2, 2);
    imshow(watermark); title('Watermark');
end

% Script to call the function
clc;
close all;
image = imread('YMwmkedKey435.tiff');
key = 435;
watermark = yeung_mintzer_extract(image, key);


"This script uses the yeung_mintzer_extract function to retrieve the watermark from a given image using a specified key. 
Replace 'YMwmkedKey435.tiff' with the actual filename of your watermarked image."
