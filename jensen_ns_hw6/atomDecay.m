function [ times ] = atomDecay( N, L )

m = 1/L;
times = exprnd(m, N, 1);

times = sort(times);

end

