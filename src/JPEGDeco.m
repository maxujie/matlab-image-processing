function img = JPEGDeco(dc, ac, height, width)
load('../resources/JpegCoeff.mat');

% decode dc
c_dc = DCDeco(dc, DCTAB);

% decode ac
c_ac = ACDeco(ac, ACTAB);

c = [c_dc; c_ac];

img = InverseEncoPreprocess(c, height, width, QTAB);
img = uint8(img);
end

