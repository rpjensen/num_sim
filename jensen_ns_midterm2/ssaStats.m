function [ T, xMean, xVar ] = ssaStats( x0,propensityFunctions ,nu,outTimes,realizations )

a = propensityFunctions;

T = outTimes;

M0 = zeros(length(T), length(x0));
M1 = zeros(length(T), length(x0));
S1 = zeros(length(T), length(x0));


tSam = T;
for run = 1:realizations
    [tTra, xTra] = ssa(x0, a, nu, outTimes(end)');
    
    % get the updated statistics for this trajectory
    [M1, M0, S1] = updateStats(tSam, tTra, xTra, M0, M1, S1, run);
    
    
end

xMean = M1;
xVar = S1;
end

