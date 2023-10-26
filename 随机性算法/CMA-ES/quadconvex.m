function f = quadconvex(x)
n = length(x);
f = 0;
for i = 1:n
    f = f + (x(i) - i)^2;
end