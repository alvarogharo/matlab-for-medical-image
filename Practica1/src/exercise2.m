im1 = imread('images/T1.tif');
im1 = rgb2gray(im1);
im1 = im2double(im1);

%% 
NLM = non_local_means(im1, 2,2,10);
gaussian = imgaussfilt(im1,2);
ansio = dif_aniso(im1, 10, 8, 0.2, 1);


subplot(221);
imshow(im1,[]);
subplot(222);
imshow(NLM, [])
subplot(223);
imshow(gaussian,[]);
subplot(224);
imshow(ansio, [])