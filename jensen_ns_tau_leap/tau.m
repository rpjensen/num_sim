function [ T, S ] = tau( x0, propensityFunctions, nu, tau, tFinal )
% - x0: a vector containing the initial (t=0) population X of the species
% - propensityFunctions: a function handle (like ?f? in our ODE solvers) that
%       takes a population X as input and returns a column vector of the
%       propensity values.
% - nu: the stoichiometric matrix, where the ith column is the stoichiometric
%       vector for reaction Ri.
% - tau: the simulation step size
% - tFinal: the simulation time (assuming t=0 is the initial time)

% Shorthand
a = propensityFunctions;

% Init times
T = (0:tau:tFinal)';

if T(end) < tFinal
    T = [T; tFinal];
end

% Init populations
xOld = x0;
S = zeros(length(T), length(x0));
S(1,:) = x0';

% Get the number of reactions
reactChannels = size(nu, 2);% equal to the number of cols

% Main loop

for i = 1:length(T)-1
    aCur = a(xOld)
    for reactI = 1:reactChannels
        xCur = xOld + poissrnd(aCur(reactI)*tau)*nu(:, reactI);
    end
    
    S(i+1,:) = xCur';
    xOld = xCur;
end

end

