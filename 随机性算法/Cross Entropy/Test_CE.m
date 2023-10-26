clear
clc
close all
format long g

Dim = 10;
Range = repmat([-10;10],1,Dim);
Best0 = -2 + 4*rand(1,Dim);
SE = 100*Dim;
Iterations=1500;

tic
[fxmin,xmin]=CE(@Rosen,Best0,SE,Range,Iterations);
toc

