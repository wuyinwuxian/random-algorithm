n = 20;
nd = 2;
pa=0.25; 
Lb = -15*ones(1,nd);
Ub = 5*ones(1,nd);
Range = [Lb;Ub];
nest = initialization(n,Range);    
optimal = [-10,1];
fitness=10^10*ones(n,1);
[fmin,bestnest,nest,fitness]=get_best_nest(@bukin6,nest,nest,fitness);
fmat=moviein(20);
for j=1:1000
      plot(nest(:,1),nest(:,2),'o',bestnest(:,1),bestnest(:,2),'ro',optimal(:,1),optimal(:,2),'r*')
      axis([-15,5,-15,5]);
      fmat(:,j)=getframe;
      % levy flight
      new_nest = get_cuckoos(nest,bestnest,Range);  
      [fmin,bestnest,nest,fitness] = get_best_nest(@bukin6,nest,new_nest,fitness);
      %crossover operator
       new_nest = empty_nests(nest,Range,pa) ;
       [fnew,best,nest,fitness] = get_best_nest(@bukin6,nest,new_nest,fitness);  
    if fnew<fmin
        fmin=fnew;
        bestnest=best;
    end
end
movie(fmat,1)
