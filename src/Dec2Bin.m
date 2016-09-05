function bin = Dec2Bin(dec)
if dec > 0
    bin = str2num(dec2bin(dec)')';
elseif dec < 0
    bin = OnesCompliment(Dec2Bin(-dec));
else
    bin = [];
end
end
