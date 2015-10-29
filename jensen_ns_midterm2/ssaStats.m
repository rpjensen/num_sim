function [ T, xMean, xVar ] = ssaStats( x0,propensityFunctions ,nu,outTimes,realizations )

a = propensityFunctions;

T = outTimes;
xMean = zeros(length(T), length(x0));
xVar = zeros(length(T), length(x0));


M0 = [zeros(length(T)-1, length(x0))];
M1 = zeros(length(T), length(x0));
S1 = zeros(length(T), length(x0));


tSam = T;
for run = 2:realizations
    [tTra, xTra] = ssa(x0, a, nu, outTimes(end));
    
    
    [r, ~] = size(tTra);
    if r == 0
        continue;
    end
    
    [M1, M0, S1] = updateStats(tSam, tTra, xTra, M0, M1, S1, run);
    
    
    
    iTra = 1;

    for iSam = 1:length(T)
        
        while (iTra <= length(tTra)) && (tTra(iTra) <= tSam(iSam))
            iTra = iTra + 1;
        end
        
        % Trajectory data just before the sample time
        newVal = xTra(min(iTra-1, 1), :);
        % Statitics isolated for this time val to simplify calulations
        m0 = M0(iSam, :);
        m1 = M1(iSam, :);
        s1 = S1(iSam, :);
        
        mTemp = m1;% reference m1 (old) before we override it with new val
        m1 = m0 + (newVal-m0)/ run;
        s1 = s1 + (newVal-m0)*(newVal-m1);
        
        m0 = mTemp;
        
        % Update the full array for this time
        M0(iSam, :) = m0;
        M1(iSam, :) = m1;
        S1(iSam, :) = s1;
        
    end
    
    
end

end

