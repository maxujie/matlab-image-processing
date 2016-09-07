function c_with_info = DCTDomainEncode(c, info, method)
binary_info_str = dec2bin(info);
binary_info_str = ['0'*ones(size(binary_info_str, 1), 8 - size(binary_info_str, 2)) binary_info_str]';
binary_info = zeros(1, length(binary_info_str(:)));
for i = 1:length(binary_info)
    binary_info(i) = str2num(binary_info_str(i));
end

c_with_info = c;

if strcmp(method, 'naive')
    for i = 1:length(binary_info(:))
        if i > length(c_with_info(:))
            break
        end
        c_with_info(i) = floor(c(i) / 2) * 2 + binary_info(i);
    end
elseif strcmp(method, 'append')
    binary_info = binary_info + binary_info - 1;
    for i = 1:size(c, 2)
        non_zero_ind = find(c(:, i) ~= 0);
        append_ind = non_zero_ind(end)+1;
        if non_zero_ind(end) == 64
            append_ind = 64;
        end
        c_with_info(append_ind, i) = binary_info(i);
    end
end
end