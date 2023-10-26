function f = quadconvex(x)
[m,n] = size(x);
f = zeros(m,1);
f_temp=0;
for j =1:m
for i = 1:n
    f_temp = f_temp + (x(i) - i)^2;
end
f(j)= f_temp;
end