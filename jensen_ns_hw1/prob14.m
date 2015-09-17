function [ boolean ] = prob14( number )
% Return true if the input number is in the range [5,123] and odd
    boolean = false;
    if number >= 5 && number <= 123 && mod(number, 2) == 1
        boolean = true;
    end

end

