im = imread("./images/mr1.png");

transformedIm = transform(im, [10,10], 90, 1.5);

imshow(transformedIm);

interpolatedIm = interpolate(im, 2);

imshow(interpolatedIm);