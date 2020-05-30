function outputImg = transform(inputImg, translation, rotationAngle, scale)
    im = imtranslate(inputImg, translation);
    im = imrotate(im, rotationAngle);
    im = imresize(im, scale);
    outputImg = im;
end

