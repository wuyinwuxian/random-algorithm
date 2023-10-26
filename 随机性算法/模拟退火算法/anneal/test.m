clear
clc
options = struct(...
        'CoolSched',@(T) (.8*T),...
        'Generator',@(x) (x+(randperm(length(x))==length(x))*randn/100),...
        'InitTemp',1,...
        'MaxConsRej',1000,...
        'MaxSuccess',20,...
        'MaxTries',300,...
        'StopTemp',1e-8,...
        'StopVal',-Inf,...
        'Verbosity',1);
tic
initial = [0,0,0];
[Best,fBest,history] = anneal(@Rosenbrock,initial,options);
toc
Best
fBest
semilogy(history)
%       CoolSched: Generates a new temperature from the previous one.
%                  Any function handle that takes a scalar as input and
%                  returns a smaller but positive scalar as output. 
%                  Default is @(T) (.8*T)
%       Generator: Generates a new solution from an old one.
%                  Any function handle that takes a solution as input and
%                  gives a valid solution (i.e. some point in the solution
%                  space) as output.
%                  The default function generates a row vector which
%                  slightly differs from the input vector in one element:
%                  @(x) (x+(randperm(length(x))==length(x))*randn/100)
%                  Other examples of possible solution generators:
%                  @(x) (rand(3,1)): Picks a random point in the unit cube
%                  @(x) (ceil([9 5].*rand(2,1))): Picks a point in a 9-by-5
%                                                 discrete grid
%                  Note that if you use the default generator, ANNEAL only
%                  works on row vectors. For loss functions that operate on
%                  column vectors, use this generator instead of the
%                  default:
%                  @(x) (x(:)'+(randperm(length(x))==length(x))*randn/100)'
%        InitTemp: The initial temperature, can be any positive number.
%                  Default is 1.
%      MaxConsRej: Maximum number of consecutive rejections, can be any
%                  positive number.
%                  Default is 1000.
%      MaxSuccess: Maximum number of successes within one temperature, can
%                  be any positive number.
%                  Default is 20.
%        MaxTries: Maximum number of tries within one temperature, can be
%                  any positive number.
%                  Default is 300.
%        StopTemp: Temperature at which to stop, can be any positive number
%                  smaller than InitTemp. 
%                  Default is 1e-8.
%         StopVal: Value at which to stop immediately, can be any output of
%                  LOSS that is sufficiently low for you.
%                  Default is -Inf.
%       Verbosity: Controls output to the screen.
%                  0 suppresses all output
%                  1 gives final report only [default]
%                  2 gives temperature changes and final report 




