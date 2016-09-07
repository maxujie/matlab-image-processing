function img_with_info = PixelDomainEncode(img, info)
binary_info = dec2bin(info);
binary_info = ['0'*ones(size(binary_info, 1), 8 - size(binary_info, 2)) binary_info]';
img_with_info = img;
for i = 1:length(binary_info(:))
    if i > length(img_with_info(:))
        break
    end
    img_with_info(i) = (img(i) - 1) / 2 * 2 + str2num(binary_info(i));
end

