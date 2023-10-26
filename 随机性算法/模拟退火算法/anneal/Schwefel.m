function Sch=Schwefel(Swarm)
Sch=sum((-Swarm.*sin(sqrt(abs(Swarm))))')';