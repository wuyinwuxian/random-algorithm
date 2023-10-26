function [yy,Xbest,history] = funffo(funfcn,x,Iteration,sizepop,alpha,Dim)
% Dim = size(x,2);
X_axis = x.*unifrnd(0,1,1,Dim);
for i=1:1:sizepop
    x(i,:) = X_axis + alpha.*(2.*unifrnd(0,1,1,Dim)-1);
    %     D(i) = Distance(x(i,:));
    %     S(i)=1/D(i);
    %     Smell(i)=funsmell(D(i));
    %     Smell(i)=funsmell(x(i,:));
    Smell(i)=feval(funfcn,x(i,:));
end
[bestSmell,bestindex]=min(Smell);
X_axis = x(bestindex,:);
Smellbest=bestSmell;
for g=1:1:Iteration
    for i=1:sizepop
        x(i,:) = X_axis + alpha.*(2.*unifrnd(0,1,1,Dim)-1);
        %         D(i) = Distance(x(i,:));
        %         S(i)=1/D(i);
        %         Smell(i)=funsmell(D(i));
        %         Smell(i)=funsmell(x(i,:));
        Smell(i)=feval(funfcn,x(i,:));
    end
    [bestSmell,bestindex]=min(Smell);
    if bestSmell<Smellbest
        X_axis = x(bestindex,:);
        Smellbest=bestSmell;
    end
    yy(g)=Smellbest;
    Xbest(g,:) = X_axis;
    history(g,:) = yy(end);
    disp([ 'iter=' num2str(g)   '      fBest=' num2str(yy(end))])
end
end
