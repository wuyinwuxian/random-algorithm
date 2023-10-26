function  [Semll] = funsmell(x)
%% 原来的测试函数
% Semll = 200 - (1/(sum(x.^2)))^2;
%% 测试函数
y = Rosenbrock(x);
% y = Rastrigin(x);
% y = Quadconvex(x);
% y = Griewank(x);
% y = Sphere(x);
%% 输出
% y = -y;
Semll = y;
end