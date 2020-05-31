im1=load_untouch_nii('./images/mr1.nii');
slices = size(im1.img, 3);
c = randperm(slices);
im1=mat2gray(im1.img(:,:,c(1)));

transformedIm = transform(im1, [10,10], 30, 0.5);

result = rigid_optimization(im1, transformedIm);

subplot(131)
imshow(im1)
subplot(132)
imshow(transformedIm)
subplot(133)
imshow(result)
subplot(133)