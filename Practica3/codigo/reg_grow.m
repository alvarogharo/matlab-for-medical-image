function reg_mask = reg_grow(image, x, y, min_gray, max_gray)
    x = round(x);
    y = round(y);
    [height, width] = size(image);
    reg_old = zeros(height, width);
    reg_mask = zeros(height, width);
    help_mask = zeros(height, width);
    if image(y,x) >= min_gray & image(y,x) <= max_gray
        reg_mask(y,x) = 255;
        while(sum(sum(reg_mask)) ~= sum(sum(reg_old)))
            reg_old = reg_mask;
            help_mask = imdilate(reg_mask,strel('disk',1,0)) - reg_mask;
            disk = find(help_mask);
            values = image(disk);
            reg_mask(disk(values >= min_gray & values <= max_gray)) = 255;
        end
    else
        disp("Selected point intensity is not inside given threshold");
        reg_mask = [];
    end
end

