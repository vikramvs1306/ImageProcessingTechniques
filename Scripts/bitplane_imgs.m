function bitplane_imgs(image)
    image = double(image);

    bitplane_imgo1 = bitget(image, 1);
    bitplane_imgo2 = bitget(image, 2);
    bitplane_imgo3 = bitget(image, 3);
    bitplane_imgo4 = bitget(image, 4);
    bitplane_imgo5 = bitget(image, 5);
    bitplane_imgo6 = bitget(image, 6);
    bitplane_imgo7 = bitget(image, 7);
    bitplane_imgo8 = bitget(image, 8);

    figure;
    subplot(2,4,1); imshow(logical(bitplane_imgo1)); title('Bitplane 1');
    subplot(2,4,2); imshow(logical(bitplane_imgo2)); title('Bitplane 2');
    subplot(2,4,3); imshow(logical(bitplane_imgo3)); title('Bitplane 3');
    subplot(2,4,4); imshow(logical(bitplane_imgo4)); title('Bitplane 4');
    subplot(2,4,5); imshow(logical(bitplane_imgo5)); title('Bitplane 5');
    subplot(2,4,6); imshow(logical(bitplane_imgo6)); title('Bitplane 6');
    subplot(2,4,7); imshow(logical(bitplane_imgo7)); title('Bitplane 7');
    subplot(2,4,8); imshow(logical(bitplane_imgo8)); title('Bitplane 8');
end

% Script to call the function
clc;
close all;
img1 = imread('LSBwmk1.tiff');
img2 = imread('LSBwmk2.tiff');
img3 = imread('LSBwmk3.tiff');

bitplane_imgs(img1);
bitplane_imgs(img2);
bitplane_imgs(img3);
