function info = DCTDomainDecode(c_with_info, method)
binary_info = [];

if strcmp(method, 'naive')
    for i = 1:length(c_with_info(:))
        binary_info(end + 1) = num2str(mod(c_with_info(i), 2));
    end
elseif strcmp(method, 'append')
    for i = 1:size(c_with_info, 2)
        non_zero_ind = find(c_with_info(:, i) ~= 0);
        binary_info(end + 1) = num2str(double(c_with_info(non_zero_ind(end), i) > 0));
    end
end    
info = [];
for i = 1:8:length(binary_info)-7
    info(end+1) = bin2dec(char(binary_info(i:i+7)));
end
info = char(info);
end

