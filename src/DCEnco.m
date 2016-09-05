function dc = DCEnco(c_dc, DCTAB)
dc = [];
dc_dict = CreateDCDict(DCTAB, 'encode');
c_diff = [c_dc(1), c_dc(1:end-1) - c_dc(2:end)];
for val = c_diff
    dc = [dc dc_dict(num2str(Category(val))) Dec2Bin(val)];
end
end

