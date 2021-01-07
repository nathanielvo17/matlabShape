%input image, output image with noise
function [output_image] = addNoise(input_image, magnitude) 
%todo add more parameters for noise and/or distributed noise such as
%gaussian
    %generate noise matrix
    im_size = size(input_image);
    im_length = im_size(1);
    im_width = im_size(2);
    noise_matrix = magnitude.*rand(im_length,im_width);
    output_image = input_image + noise_matrix;
    
end