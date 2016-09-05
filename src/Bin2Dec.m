function dec = Bin2Dec(bin)
if isempty(bin)
    dec = 0;
elseif ~bin(1)
    dec = -bin2dec(num2str(OnesCompliment(bin)));
else
    dec = bin2dec(num2str(bin));
end
end

