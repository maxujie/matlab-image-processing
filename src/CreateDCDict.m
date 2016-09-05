function dc_dict = CreateDCDict(DCTAB, option)
dc_dict = containers.Map();
if strcmp(option, 'encode')
    for category = 1:size(DCTAB, 1)
        dc_dict(num2str(category - 1)) = DCTAB(category, 2:DCTAB(category, 1)+1);
    end
elseif strcmp(option, 'decode')
    for category = 1:size(DCTAB, 1)
        dc_dict(num2str(DCTAB(category, 2:DCTAB(category, 1)+1))) = category - 1;
    end
end
end