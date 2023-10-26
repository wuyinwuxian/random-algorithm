function f= quadconvex(x)
% -10*n <= x <= 10*n
n = length(x);
global t
f=0;
t=t+1;
for i = 1:n
    f = f + (x(i) - i)^2;
end