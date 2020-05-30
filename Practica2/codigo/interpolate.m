function outputIm = interpolate(im, factor)
    factor = 1/factor;
    im = rgb2gray(im);
    im = im2double(im);
    imSize =  size(im);
    [x y] = meshgrid(1:imSize(2), 1:imSize(1));
    [xi yi] = meshgrid(1:factor:imSize(2), 1:factor:imSize(1));
    outputIm = interp2(x,y,im,xi,yi,'linear');
end

