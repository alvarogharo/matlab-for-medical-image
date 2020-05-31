img = imread("./images/higado.bmp");
img = rgb2gray(img);
img = im2double(img);

hx = fspecial('prewitt');
hy = fspecial('prewitt')';

x_grad = imfilter(img, hx);
y_grad = imfilter(img, hy);

grad = x_grad+y_grad;

water = watershed(grad);
water = label2rgb(water);

marker = false(size(grad));

min_size = 50;
num_minimums = 5;

imshow(img, []);
[x,y] = ginput(num_minimums);
x = round(x);
y = round(y);
size(x,2)
for i=1:size(x,1)
    marker(y(i):y(i)+min_size, x(i):x(i) +min_size) = true;
end
imshow(marker, []);
min_image = imimposemin(grad,marker);

water2 = watershed(min_image);
water2 = label2rgb(water2);

subplot(141);
imshow(img);
subplot(141);
imshow(img);
subplot(142);
imshow(grad);
subplot(143);
imshow(water);
subplot(144);
subplot(142);
imshow(grad);
subplot(143);
imshow(water);
subplot(144);
imshow(water2);