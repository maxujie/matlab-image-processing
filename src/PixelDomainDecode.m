function info = PixelDomainDecode(img_with_info)
binary_info = [];
for i = 1:length(img_with_info(:))
    binary_info(end + 1) = num2str(mod(img_with_info(i), 2));
end
info = [];
for i = 1:8:length(binary_info)
    info(end+1) = bin2dec(char(binary_info(i:i+7)));
end
info = char(info);
end

