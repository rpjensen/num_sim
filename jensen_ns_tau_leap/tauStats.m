function [ T, xMean, xVar ] = tauStats( x0,propensityFunctions ,nu,outTimes,realizations, g )

a = propensityFunctions;

T = outTimes;

M0 = zeros(length(T), length(x0));
M1 = zeros(length(T), length(x0));
S1 = zeros(length(T), length(x0));


tSam = T;
for run = 1:realizations
    if mod(run, 10) == 1
        fprintf('Just finished run %g, %g%% of the way done.\n', run, 100*run/realizations);
    end
    [tTra, xTra] = ssa(x0, a, nu, outTimes(end)');
    [tTra, xTra] = tau(x0, a, nu, outTimes(end)', g)
    
    % get the updated statistics for this trajectory
    [M1, M0, S1] = updateStats(tSam, tTra, xTra, M0, M1, S1, run);
    
    
end

if realizations == 1
    M1 = M0;
end
xMean = M1;
xVar = S1./(min(realizations-1, 1));
end

