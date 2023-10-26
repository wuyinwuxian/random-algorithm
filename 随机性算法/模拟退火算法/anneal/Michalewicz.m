function Sin = Michalewicz(Swarm)
[SwarmSize, Dim] = size(Swarm);
indices = repmat(1:Dim, SwarmSize, 1);
Sin = -sum((sin(Swarm).*sin(indices.*Swarm.^2/pi).^20)')';