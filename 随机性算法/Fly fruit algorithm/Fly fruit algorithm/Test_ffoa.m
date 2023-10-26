clear all
clc

Range = [-100;100];
Dim = 15;

Iteration = 2000;    %迭代次数
sizepop = 20;       %种群大小
alpha = 0.5;          %种群搜索范围大小
x = (Range(2,:) - Range(1,:)).*unifrnd(0,1,1,Dim) + Range(1,:);
tic                 %计算时间 
[yy,Xbest,history] = funffo(@Rosenbrock,x,Iteration,sizepop,alpha,Dim);
toc
semilogy(history)


