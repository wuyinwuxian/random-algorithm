function y = Easom(x)
% -100 <= x <= 100
x1 = x(:,1);
x2 = x(:,2);
y = -cos(x1).*cos(x2).*exp(-(x1-pi).^2-(x2-pi).^2);
