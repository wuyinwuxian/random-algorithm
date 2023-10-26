clear;
close all;
clc;

SearchAgents_no = 30;
Max_iter = 1000;
lb = -1e2;
ub = 1e2;
dim = 100;
objfun = @Rastrigin;

tic
[fval,x,GWO_cg_curve]=GWO(SearchAgents_no,Max_iter,lb,ub,dim,objfun);
toc

