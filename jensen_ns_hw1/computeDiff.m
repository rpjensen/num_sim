function [ diffs ] = computeDiff( vector )
% Compute the successfive diffs of a the input vector
% eg computeDiff([2 4 5 2 7]) => [-2 -1 3 -5]
    diffs = zeros(length(vector)-1, 1);% init the diffs to one less than the lenght of the input vector
    for i = 1:length(vector)-1
        diffs(i) = vector(i) - vector(i+1);
    end

end

