im1 = imread("./images/hueso.tif");

imshow(im1, []);
[x,y] = ginput(1);

mask = reg_grow(im1, x, y, 220, 255);

imshow(mask, []);