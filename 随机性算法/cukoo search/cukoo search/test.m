clear all
clc
format short
format compact
nd = 5000; % Î¬Êý
Lb = -1e4*ones(1,nd);
Ub = 1e4*ones(1,nd);
Range = [Lb;Ub];
N_IterTotal = 1e5;
% N = 1;
tic
% for i = 1:N
[fmin,bestnest,history] = cukoo_search(@quadconvex,Range,N_IterTotal);
%  Xstate(i,:) = bestnest;
%  Fstate(i) = fmin;  
%  F_history{i} = history;
%    
% end
toc 

% f = vpa(Fstate,4)
% 
%  len = 4;
%  best_f = vpa(min(Fstate),len)
%  median_f = vpa(median(Fstate),len)
%  worst_f = vpa(max(Fstate),len)
% mean_f = vpa(mean(Fstate),len)


% t = 1:N_IterTotal;
% t = t';
% figure(1)
% plot(t,history,'r-','LineWidth',2)
% figure(2)
% semilogy(history)