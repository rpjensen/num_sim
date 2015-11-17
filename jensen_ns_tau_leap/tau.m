function [ T, S ] = tau( x0, propensityFunctions, nu, tFinal, g )
% - x0: a vector containing the initial (t=0) population X of the species
% - propensityFunctions: a function handle (like ?f? in our ODE solvers) that
%       takes a population X as input and returns a column vector of the
%       propensity values.
% - nu: the stoichiometric matrix, where the ith column is the stoichiometric
%       vector for reaction Ri.
% - tFinal: the simulation time (assuming t=0 is the initial time)
% Parameters
e = .03;
nc = 10;
sc = 10;
ssaSteps = 100;


% Shorthand
a = propensityFunctions;

% Init times
tCur = 0;
T = 0;

% Init populations
x = x0;
S = x0';

skipToStep3 = false;

% Main loop
while tCur < tFinal
    if ~skipToStep3
        % ========= Step 1 =========
        % Calculate critical reactions
       [crI, ncrI] = criticalReactions(x, a, nu, nc);

        pAll = a(x);
        pCR0 = 0;
        pNCR0 = 0;

        for i = 1:length(ncrI)
            pNCR0 = pNCR0 + pAll(ncrI(i));
        end
        for i = 1:length(crI)
            pCR0 = pCR0 + pAll(crI(i));
        end

        % ========= Step 2 =========
        % Compute Tau' based on non-critical reactions
        if isempty(ncrI)
            tauPrime = Inf;
        else
            tauPrime = getTauPrime(x, pAll, nu, ncrI, e, g);
            if (tCur + tauPrime > tFinal)
                tauPrime = tFinal - tCur;
            end
        end
    end
    % ========= Step 3 =========
    % If not enought non-crit reactions will occure do ssa for ssaSteps
    % steps and go to (1)
    % Else continue to (4)
    skipToStep3 = false;
    
    if (tauPrime < sc/pNCR0)
        [tSSA, sSSA] = ssa( x0, propensityFunctions, nu, tCur, tFinal, ssaSteps )
        T = [T; tSSA];
        S = [S; sSSA];
        tCur = T(end);
        continue;
    end
    
    % ========= Step 4 =========
    % Calculate the prop sum of crit reactions and find time to next crit
    % reaction
    tauDPrime = exprnd(1/ pCR0);
    
    % ========= Step 5 =========
    % Calculate the change in each population with the assumption that zero
    % or one crit reaction will occur each tau
    tau = min(tauPrime, tauDPrime);
    
    k = zeros(length(pAll));
    for j = 1:length(ncrI)
        k(ncrI(j)) = pAll(ncrI(j))*tau;
    end
    
    if (tauDPrime < tauPrime)
        % all Critical reaction have zero prop except the one critical
        % reaction
        
        r = rand() * pCR0;

        % Find index into reaction probability array for just critical
        % reaction events
        jSum = 0;
        j = 0;
        while jSum < r && j < length(ncrI)
            j = j + 1;
            jSum = jSum + pAll(ncrI(j));
        end
        k(crI(j)) = 1;
    end
    
    % ========= Step 6 =========
    % If negative population go back to (3) 
    % else update t and the populations and go to (1)
    xNew = x;
    
    for j = 1:length(pAll)
        xNew = xNew + k(j)*nu(j);
    end
    
    if min(xNew) > 0
        tCur = tCur + tau;
        
        x = xNew;
        T = [T tCur];
        S = [S; x'];
    
    else
        % Go to step (3) bad draw at the Poisson Dist
        tauPrime = tauPrime / 2;
        skipToStep3 = true;
    end

        
end

% Append the final position since no more decays have occured since the
% loop ended
T = [T tFinal]';
S = [S; x'];

end

