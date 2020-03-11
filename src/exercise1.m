%% Preprocessing
im1 = imread('images/T1.tif');
im1 = rgb2gray(im1);
im2 = imread('images/T2.tif');
im2 = rgb2gray(im2);

dif1 = dif_aniso(im1, 30, 8, 0.2, 1);
dif2 = dif_aniso(im2, 30, 8, 0.2, 1);

%% N iter variation
dif1 = dif_aniso(im1, 100, 8, 0.2, 1);
dif2 = dif_aniso(im2, 100, 8, 0.2, 1);

%Decreasing the number of iterations reduces the noise reduction and creates
%poor results
%Increasing the number of iterations creates a segamentated style image.
%High frequences changes are very sharp, and detail information could be
%lost.

%% K variation
dif1 = dif_aniso(im1, 30, 30, 0.2, 1);
dif2 = dif_aniso(im2, 30, 30, 0.2, 1);

% kappa controls conduction as a function of gradient.  If kappa is low
% small intensity gradients are able to block conduction and hence diffusion
% across step edges.  A large value reduces the influence of intensity
% gradients on conduction (blurry)

%% Lambda variation
dif1 = dif_aniso(im1, 30, 8, 0.40, 1);
dif2 = dif_aniso(im2, 30, 8, 0.4, 1);

%Decreasing lambda reduces the noise reduction and creates
%poor results
%Increasing lambda creates checkboard noise pattern on the image

%% Function variation
dif1 = dif_aniso(im1, 30, 8, 0.2, 1);
dif2 = dif_aniso(im2, 30, 8, 0.2, 1);

% 1 for high frequences enhancement
% 2 for low frequences enhancement
%% Plotting
subplot(221);
imshow(im1,[]);
subplot(222);
imshow(dif1, [])

subplot(223);
imshow(im2,[]);
subplot(224);
imshow(dif2, [])