function feature = Image2Feature(img, l)
img = uint32(img);
img = bitshift(img, l-8);
img_color_code = bitshift(img(:, :, 1), 2 * l) + ...
    bitshift(img(:, :, 2), l) + img(:, :, 3);
feature = histc(img_color_code(:), 0:2^(3*l)-1) / numel(img_color_code);
end

