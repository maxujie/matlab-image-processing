function factors = JPEGEncoPreprocess(img, QTAB)
img = padarray(img, round(8 * (ceil(size(img) ./ 8) - size(img) ./ 8)), 'replicate', 'post');
[height, width] = size(img);

zig_zag = ZigZag;
factors = [];
for i = 1:8:height-1
    for j = 1:8:width-1
        c = dct2(img(i:i+7, j:j+7));
        c(1, 1) = c(1, 1) - 1024;
        c = round(c ./ QTAB);
        factors(:, end+1) = c(zig_zag);
    end
end
end

