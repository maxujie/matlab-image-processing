function c = MyDCT2(p)
n = size(p, 1);
assert(all(size(p) == n));
d = MatD(n);
c = d * p * d';
end

function d = MatD(n)
x = 0:n-1;
y = 1:2:(2*n-1);
d = cos(x' * y * pi / (2 * n));
d(1, :) = sqrt(1/2);
d = sqrt(2 / n) * d;
end
