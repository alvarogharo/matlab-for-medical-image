%% Preprocessing
im1 = imread('images/T1.tif');
im1 = rgb2gray(im1);
im2 = imread('images/T2.tif');
im2 = rgb2gray(im2);

%% Good approach

dif1 = dif_aniso(im1, 30, 8, 0.2, 1);
dif2 = dif_aniso(im2, 30, 8, 0.2, 1);

dif3 = dif_aniso_mult(im1, im2, 30, 8, 0.2, 1);

%% Plotting
subplot(231);
imshow(im1,[]);
subplot(234);
imshow(im2, []);

subplot(232);
imshow(dif1,[]);
subplot(235);
imshow(dif2, []);

subplot(233);
imshow(dif3,[]);
