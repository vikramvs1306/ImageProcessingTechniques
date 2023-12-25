function [watermarked_image] = yeung_mintzer_watermark(image, watermark, key)
    % Convert image to double precision
    image = im2double(image);
    watermark = im2double(watermark);

    % Generate lookup table using key
    rng(key);
    lut = double(rand(256, 2) > 0.5);

    % Flatten image and watermark
    flat_image = reshape(image, 1, []);
    flat_watermark = reshape(watermark, 1, []);

    % Embed watermark into image
    for i = 1:length(flat_image)
        pixel_value = round(max(min(flat_image(i) * 255, 255), 0));
        watermark_bit = logical(flat_watermark(i));
        embedded_bit = lut(pixel_value + 1, watermark_bit + 1);
        flat_image(i) = (pixel_value + embedded_bit) / 255;
    end

    % Reshape image back to original dimensions
    watermarked_image = im2uint8(reshape(flat_image, size(image)));

    % Display and save the watermarked image
    figure;
    imshow(watermarked_image);
    imwrite(watermarked_image, 'modified_image.tif');
end

% Script to call the function
clc;
close all;
image = imread('image_filename.tif'); % Replace with your image filename
watermark = imread('watermark_filename.tif'); % Replace with your watermark filename
key = 12345; % Example key
watermarked_img = yeung_mintzer_watermark(image, watermark, key);



