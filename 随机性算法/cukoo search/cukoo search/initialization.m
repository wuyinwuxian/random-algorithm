function nest = initialization(n,Range)

Lb = Range(1,:);
Ub = Range(2,:);
for i=1:n
nest(i,:)=Lb+(Ub-Lb).*rand(size(Lb));
end
