
clear all
close all
clc

% Set ABC Control Parameters
ABCOpts = struct( 'ColonySize',  200, ...   % Number of Employed Bees+ Number of Onlooker Bees 
    'MaxCycles', 2000,...   % Maximum cycle number in order to terminate the algorithm
    'ErrGoal',     1e-20, ...  % Error goal in order to terminate the algorithm (not used in the code in current version)
    'Dim',       10 , ... % Number of parameters of the objective function   
    'Limit',   100, ... % Control paramter in order to abandone the food source 
    'lb',  -3, ... % Lower bound of the parameters to be optimized
    'ub',  3, ... %Upper bound of the parameters to be optimized
    'ObjFun' , 'quadconvex', ... %Write the name of the objective function you want to minimize
    'RunTime',1); % Number of the runs 

[GlobalMin,GlobalParams,GlobalMins] = ABC(ABCOpts);


% semilogy(mean(GlobalMins,1))
% title('Mean of Best function values');
% xlabel('cycles');
% ylabel('error');
% fprintf('Mean =%g Std=%g\n',mean(GlobalMins(:,end)),std(GlobalMins(:,end)));