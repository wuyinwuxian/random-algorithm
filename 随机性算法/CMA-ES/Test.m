clear
clc
close all;
format short
format compact

Dim = 2;% 
Range = repmat([-100;100],1,Dim);%ËÑË÷·¶Î§
Iterations = 1000;%
Best = Range(1,:) + (Range(2,:) - Range(1,:)).*rand(1,Dim);

tic
[xmin,fxmin,history,history_xmean] = CMAES(@Rosenbrock,Dim,Range,Iterations);
toc
xmin;
fxmin
figure(1)
plot(history)
semilogy(history)
title('CMAES')
