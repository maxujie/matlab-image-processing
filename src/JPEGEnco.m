function [dc, ac, height, width] = JPEGEnco(img)
load('../resources/JpegCoeff.mat');
[height, width] = size(img);
c = JPEGEncoPreprocess(img, QTAB);

dc = DCEnco(c(1, :), DCTAB);

ac = ACEnco(c(2:end, :), ACTAB);
end

