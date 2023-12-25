function bit_plane_image = bit_plane(image, bit_plane_number)
    image = double(image);
    % Extract the specified bit plane
    bit_plane_image = bitget(image, bit_plane_number);
    % Display the bit plane
    figure;
    imshow(logical(bit_plane_image)); % Convert to logical for proper display
end

% Script to call the function
clc;
close all;
peppers = imread('peppers.tif');
baboon = imread('baboon.tif');

bit_plane_number = 4;
bit_plane(peppers, bit_plane_number);
bit_plane(baboon, bit_plane_number);


%"The highest bitplane for Peppers is bitplane 3 or 4 that no longer resembles
%image contect instead it appears noise. And for baboon it is bitplane 4 or 5.
%The peppers image has more details and structures, so higher bitplane 
%retain more content. Baboon has less complex structures and details, so 
%higher bitplanes already appear noise."
