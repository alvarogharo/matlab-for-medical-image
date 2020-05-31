% Demo of "Chan Vese Level Sets"
%
% Example:
% seg_demo
%
% Coded by: Shawn Lankton (www.shawnlankton.com)

I = imread('./images/ec.jpg');  %-- load the image
m = zeros(size(I,1),size(I,2));          %-- create initial mask
m(100:125,100:125) = 1;



subplot(2,2,1); imshow(I); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');

seg = chanvese(I, m, 350, 0.4, 50, 9500); %-- Run segmentation

subplot(2,2,4); imshow(seg); title('Global Region-Based Segmentation');


