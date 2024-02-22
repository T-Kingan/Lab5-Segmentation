clear all
close all

% read the images circuits and brain_tumor
f = imread('assets/circuit_rotated.tif'); % circuits
g = imread('assets/brain_tumor.jpg');

% Write a function to use the edge function to detect the edges of the images with three methods:
% Sobel , LoG and Canny

% Sobel
sobel_f = edge(f, 'sobel');
sobel_g = edge(g, 'sobel');

% LoG
log_f = edge(f, 'log');
log_g = edge(g, 'log');

% Canny
canny_f = edge(f, 'canny');
canny_g = edge(g, 'canny');

% Display the original and the edge detected images in a montage
figure
montage({f, sobel_f, log_f, canny_f}, 'Size', [1, 4]);
title('Circuits')

figure
montage({g, sobel_g, log_g, canny_g}, 'Size', [1, 4]);
title('Brain Tumor')

