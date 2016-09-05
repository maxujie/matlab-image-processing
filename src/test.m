load('../resources/JpegCoeff.mat');

c_ac_test = [10, 3, 0, 0, 2, zeros(1, 20), 1, zeros(1, 37)]';
ac_test = [1,0,1,1,1,0,1,0,0,1,1,1,1,1,1,1,1,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1,0,1,0];

c_ac_result = ACDeco(ac_test, ACTAB);
ac_result = ACEnco(c_ac_test, ACTAB);

assert(all(ac_test == ac_result));
assert(all(c_ac_test == c_ac_result));

c_dc_test = [10 8 60];
dc_test = [1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1];

c_dc_result = DCDeco(dc_test, DCTAB);
dc_result = DCEnco(c_dc_test, DCTAB);

assert(all(dc_test == dc_result));
assert(all(c_dc_test == c_dc_result));
