function outputImg = transform(inputImg, translation, rotationAngle, scale)
    im = imtranslate(inputImg, translation);
    im = imrotate(im, rotationAngle);
    im = interpolate(im, scale);
    outputImg = im;
end

