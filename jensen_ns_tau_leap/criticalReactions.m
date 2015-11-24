function [ criticalIndexes, nonCriticalIndexes ] = criticalReactions( x, a, nu, nc )


props = a(x);
criticalIndexes = [];
nonCriticalIndexes = [];

% For each reaction channel
for j = 1:length(props)
    % If the propensity is less than zero
    if (props(j) > 0)
        minL = Inf;
        % For each population
        for i = 1:length(x)
            % If the population decays on this reaction
            if (nu(i,j) < 0)
                % Find the number of reactions to negative pop 
                reactCount = x(i) / abs(nu(i,j));
                % Adjust the reaction min
                minL = min(reactCount, minL);
            end
        end
        % if the min is within the critical threshold append this reaction
        % index to the output
        if (minL < nc)
            criticalIndexes = [criticalIndexes; j];
        else
            nonCriticalIndexes = [nonCriticalIndexes; j];
        end
    end

end

end

