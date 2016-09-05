function ac_dict = CreateACDict(ACTAB, option)
ac_dict = containers.Map();
if strcmp(option, 'encode')
    for category = 1:size(ACTAB, 1)
        ac_dict(num2str(ACTAB(category, 1:2))) = ACTAB(category, 4:ACTAB(category, 3) + 3);
    end
elseif strcmp(option, 'decode')
    for category = 1:size(ACTAB, 1)
        ac_dict(num2str(ACTAB(category, 4:ACTAB(category, 3) + 3))) = ACTAB(category, 1:2);
    end
end
end
