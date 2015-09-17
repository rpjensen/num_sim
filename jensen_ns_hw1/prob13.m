function [ larger ] = prob13( v1, v2 )
% Return the vector with more elements. In the case of a tie return the
% first vector (v1).
    larger = v1;
    if length(v2) > length(v1)
        larger = v2;
    end

end

