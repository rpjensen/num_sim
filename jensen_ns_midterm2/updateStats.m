function [ M1, M0, S1 ] = updateStats( tSam, tTra, xTra, M0, M1, S1, run)


iTra = 1; % index into the trajectory values

% index into the sample array
for iSam = 1:length(tSam)
    % If we are not passed the next sample time keep going
    while (iTra <= length(tTra)) && (tTra(iTra) <= tSam(iSam))
        iTra = iTra + 1;
    end

    % Trajectory data just before the sample time
    newVal = xTra(max(iTra-1, 1), :);


    % Statitics isolated for this time val to simplify calulations
    m0 = M0(iSam, :);
    m1 = M1(iSam, :);
    s1 = S1(iSam, :);
    if run > 1
        
        mTemp = m1;% reference m1 (old) before we override it with new val
        m1 = m0 + (newVal-m0)/ run;
        s1 = s1 + (newVal-m0).*(newVal-m1);

        if run > 2
            m0 = mTemp;
        end

    else
        % initialize the statistics
        m0 = newVal;
        s1 = zeros(1, length(newVal));
    end

    % Update the full array for this time
    M0(iSam, :) = m0;
    M1(iSam, :) = m1;
    S1(iSam, :) = s1;

end
end

