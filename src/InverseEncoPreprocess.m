function img = InverseEncoPreprocess(factors, height, width, QTAB)
img = zeros(ceil(height / 8) * 8, ceil(width / 8) * 8);

zig_zag = ZigZag;

cnt = 1;
for i = 1:8:height-1
    for j = 1:8:width-1
        c = zeros(8, 8);
        c(zig_zag) = factors(:, cnt);
        cnt = cnt + 1;
        c = c .* QTAB;
        c(1, 1) = c(1, 1) + 1024;
        img(i:i+7, j:j+7) = idct2(c);
    end
end
img = img(1:height, 1:width);
end
