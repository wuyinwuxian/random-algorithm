function [S_best_overall,X_best_overall,S_best_history,sigma_history]=CE(funfcn,Best0,SE,Range,Iterations)

n = length(Best0); % select dimension
Nel = 10; N = SE; alpha = 0.8; beta = 0.7; q = 5;
eps = 1e-3;
mu =  Best0;% select initial mu
sigma = 100*ones(1,n); % select initial sigma 
mu_last = mu;
sigma_last = sigma;
X_best_overall = zeros(1,n);
S_best_overall = 1E10;
t = 0; % 迭代次数

while t<Iterations%1500%sigma > eps%
    t = t+1;
    mu = alpha*mu + (1-alpha)*mu_last;% 平滑化处理,目测，对于rosenbrock问题，这个平滑并没有什么用
    B_mod = beta - beta*(1-1/t)^q;
    sigma = B_mod*sigma + (1-B_mod)*sigma_last; % dynamic smoothing %真正起作用的是这个平滑
%     sigma= alpha*sigma + (1-alpha)*sigma_last ; % fixed smoothing
    sigma_history(t,:) = sigma;
    X = ones(N,1)*mu + randn(N,n)*diag(sigma); % generate samples 产生N个以sigma为方差，零均值的正态随机样本
    SA = feval(funfcn,X); % select performance function Hougen1  Rosen
    [S_sort,I_sort] = sort(SA); % sort 从低到高排序
    gam = S_sort(Nel);% gam 取其0.1分位点
    S_best = S_sort(1);% S_best 取最小的那一个
    if (S_best < S_best_overall)% 判断是否有进步，若有进步则更新
        S_best_overall = S_best;
        X_best_overall = X(I_sort(1),:);
    end
    mu_last = mu;% 保存上一次的数据
    sigma_last = sigma;% 保存上一次的数据
    Xel = X(I_sort(1:Nel),:);% 取前Nel个作为精英个体
    mu = mean(Xel);% 取其平均值作为更新点
    sigma = std(Xel);% 取其方差作为方差
    S_best_history(t,:) = S_best;
%     if mod(t,100)==0 % print each 100 iterations
%         fprintf('%d %5.4f',t,S_best);
%         fprintf(' %5.4f',mu)
%         fprintf('\n')
%         fprintf(' %5.4f',sigma)
%         fprintf('\n')
    fprintf('%d %5.4f',t,S_best_overall);
    fprintf('\n')
end;
end