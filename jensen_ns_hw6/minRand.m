function [ m ] = minRand( times )
vals = exprnd(2, times, 2);
m = min(vals(:,1), vals(:,2));



end

