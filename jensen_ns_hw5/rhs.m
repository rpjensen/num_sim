function [ dy ] = rhs( t, y )
% RHS Function for hw 5

dy = [-80.6, 119.4; 79.6, -120.4] * y; 


end

