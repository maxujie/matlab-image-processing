function bin = Dec2Bin(dec)
if dec >= 0
    bin = str2num(dec2bin(dec)')';
else
    bin = OnesCompliment(Dec2Bin(-dec));
end
end