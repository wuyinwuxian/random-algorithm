function [fmin,bestnest,history] = cukoo_search(funfcn,Range,N_IterTotal)

% Number of nests (or different solutions)种群规模
n = 50;  
% Discovery rate of alien eggs/solutions
pa=0.25;      
history = zeros(N_IterTotal,1);
%初始化种群
nest = initialization(n,Range);    

fitness=10^10*ones(n,1);
[fmin,bestnest,nest,fitness]=get_best_nest(funfcn,nest,nest,fitness);

N_iter=0;

for iter=1:N_IterTotal
    % Generate new solutions (but keep the current best)
    
%     plot(nest(:,1),nest(:,2),'o',bestnest(:,1),bestnest(:,2),'ro',optimal(:,1),optimal(:,2),'r*')
%     axis([-20,20,-20,20])
    
    new_nest = get_cuckoos(nest,bestnest,Range);  
    
%     plot(new_nest(:,1),new_nest(:,2),'o',bestnest(:,1),bestnest(:,2),'ro',optimal(:,1),optimal(:,2),'r*')
%     axis([-20,20,-20,20])
    
    [fmin,bestnest,nest,fitness] = get_best_nest(funfcn,nest,new_nest,fitness);
    
    % Discovery and randomization
      new_nest = empty_nests(nest,Range,pa) ;
    
    % Evaluate this set of solutions
      [fnew,best,nest,fitness] = get_best_nest(funfcn,nest,new_nest,fitness);
   
    % Find the best objective so far  
    if fnew<fmin
        fmin=fnew;
        bestnest=best;
    end
    history(iter) = fmin;
    fmin
end 
