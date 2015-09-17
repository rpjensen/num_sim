function [ dy ] = problem3( t, y )
% RHS Function for hw 3 problem 3

dy = zeros(2,1);
dy(1) = 2*y(1) - 1.2*y(1).*y(2);
dy(2) = -y(2) + 0.9*y(1).*y(2);

end

