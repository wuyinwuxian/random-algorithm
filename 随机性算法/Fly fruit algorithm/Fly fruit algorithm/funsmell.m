function  [Semll] = funsmell(x)
%% ԭ���Ĳ��Ժ���
% Semll = 200 - (1/(sum(x.^2)))^2;
%% ���Ժ���
y = Rosenbrock(x);
% y = Rastrigin(x);
% y = Quadconvex(x);
% y = Griewank(x);
% y = Sphere(x);
%% ���
% y = -y;
Semll = y;
end