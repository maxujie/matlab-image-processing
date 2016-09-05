function dec = Bin2Dec(bin)
if ~bin(1)
    dec = -bin2dec(num2str(OnesCompliment(bin)));
else
    dec = bin2dec(num2str(bin));
end
end

