function c_dc = DCDeco(dc, DCTAB)
c_dc = [];
dc_dict = CreateDCDict(DCTAB, 'decode');

st = 1;
ed = 1;

while st <= length(dc)
    cur_token = num2str(dc(st:ed));
    if dc_dict.isKey(cur_token)
        category = dc_dict(cur_token);
        if category == 0
            category = 1;
        end
        cur_val = dc(ed+1:ed+category);
        c_dc(end + 1) = Bin2Dec(cur_val);
        st = ed + category + 1;
        ed = ed + category + 1;
    else
        ed = ed + 1;
    end
end

c_dc = cumsum([c_dc(1) -c_dc(2:end)]);
end
