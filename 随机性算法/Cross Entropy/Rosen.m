function out = Rosen(X)
r=[];
for i = 1:size(X,2)-1
r = [100*(X(:,i+1)-X(:,i).^2).^2+(X(:,i)-1).^2,r];
end
out = sum(r,2);