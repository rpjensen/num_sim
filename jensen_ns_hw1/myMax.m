function [ max ] = myMax( vector )
% Return the max of the given vector
    max = vector(1);
    for i = 2 : length(vector)
        if vector(i) > max
            max = vector(i);
        end
    end
end

