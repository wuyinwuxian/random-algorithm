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
t = 0; % ��������

while t<Iterations%1500%sigma > eps%
    t = t+1;
    mu = alpha*mu + (1-alpha)*mu_last;% ƽ��������,Ŀ�⣬����rosenbrock���⣬���ƽ����û��ʲô��
    B_mod = beta - beta*(1-1/t)^q;
    sigma = B_mod*sigma + (1-B_mod)*sigma_last; % dynamic smoothing %���������õ������ƽ��
%     sigma= alpha*sigma + (1-alpha)*sigma_last ; % fixed smoothing
    sigma_history(t,:) = sigma;
    X = ones(N,1)*mu + randn(N,n)*diag(sigma); % generate samples ����N����sigmaΪ������ֵ����̬�������
    SA = feval(funfcn,X); % select performance function Hougen1  Rosen
    [S_sort,I_sort] = sort(SA); % sort �ӵ͵�������
    gam = S_sort(Nel);% gam ȡ��0.1��λ��
    S_best = S_sort(1);% S_best ȡ��С����һ��
    if (S_best < S_best_overall)% �ж��Ƿ��н��������н��������
        S_best_overall = S_best;
        X_best_overall = X(I_sort(1),:);
    end
    mu_last = mu;% ������һ�ε�����
    sigma_last = sigma;% ������һ�ε�����
    Xel = X(I_sort(1:Nel),:);% ȡǰNel����Ϊ��Ӣ����
    mu = mean(Xel);% ȡ��ƽ��ֵ��Ϊ���µ�
    sigma = std(Xel);% ȡ�䷽����Ϊ����
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