function [ T, S ] = ssa( x0, propensityFunctions, nu, tFinal )
% - x0: a vector containing the initial (t=0) population X of the species
% - propensityFunctions: a function handle (like ?f? in our ODE solvers) that
%       takes a population X as input and returns a column vector of the
%       propensity values.
% - nu: the stoichiometric matrix, where the ith column is the stoichiometric
%       vector for reaction Ri.
% - tFinal: the simulation time (assuming t=0 is the initial time)

% Shorthand
a = propensityFunctions;

% Init times
tCur = 0;
T = 0;

% Init populations
x = x0;
S = x0';

% Main loop
while tCur < tFinal
   
    p = a(x);
    p0 = sum(p);
    
    % Zero propensity sum --> No reaction possible, population constant for
    % all t
    if p0 <= 0
        break; 
    end
    
    % Generate the delta to next reaction
    tau = exprnd(1/p0);
    % Generate distribution across all the propensity probabilities
    r = rand() * p0;
    
    % Find index into reaction probability array
    jSum = 0;
    j = 0;
    while jSum < r && j < length(p)
        j = j + 1;
        jSum = jSum + p(j);
    end
    
    
    % If this reaction occured before the end of the simulation, record it
    if (tCur + tau) < tFinal
        % Update state
        tCur = tCur + tau;
        x = x + nu(:, j);
        % Update output
        T = [T tCur];
        S = [S; x'];
    else
        break;
    end
        
end

% Append the final position since no more decays have occured since the
% loop ended
T = [T tFinal]';
S = [S; x'];

end

