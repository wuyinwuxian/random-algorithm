clear all
clc

Range = [-100;100];
Dim = 15;

Iteration = 2000;    %��������
sizepop = 20;       %��Ⱥ��С
alpha = 0.5;          %��Ⱥ������Χ��С
x = (Range(2,:) - Range(1,:)).*unifrnd(0,1,1,Dim) + Range(1,:);
tic                 %����ʱ�� 
[yy,Xbest,history] = funffo(@Rosenbrock,x,Iteration,sizepop,alpha,Dim);
toc
semilogy(history)


