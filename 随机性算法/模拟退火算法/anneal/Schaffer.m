

function Schafed=Schaffer(Swarm)
[SwarmSize, Dim] = size(Swarm);
Swarm1 = Swarm(:, 1:(Dim-1));
Swarm2 = Swarm(:, 2:Dim);
Schafed = 0.5+(sin(sqrt(Swarm2.^2+Swarm1.^2)).^2-0.5)./(1+0.001*(Swarm2.^2+Swarm1.^2)).^2;


