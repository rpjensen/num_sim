function [ dP ] = RHS( t, P )

S = [[3 1 0 0]', [2 0 1 0]', [2 1 0 1]', [1 0 1 1]', [1 1 0 2]', [0 0 1 2]', [0 1 0 3]'];

dP = zeros(7, 1);

% A(i,S(:,j)) is the ith reaction propensity at the jth state
% P(j) is the probability of the jth state at time t
dP(1) = - A(1, S(:,1))*P(1) + A(2, S(:,2))*P(2);

dP(2) = -(A(2, S(:,2)) + A(3, S(:,2)))*P(2) + A(1, S(:,1))*P(1);

dP(3) = - A(1, S(:,3))*P(3) + A(2, S(:,4))*P(4) + A(3, S(:,2))*P(2);

dP(4) = -(A(2, S(:,4)) + A(3, S(:,4)))*P(4) + A(1, S(:,3))*P(3);

dP(5) = - A(1, S(:,5))*P(5) + A(2, S(:,6))*P(6) + A(3, S(:,4))*P(4);

dP(6) = -(A(2, S(:,6)) + A(3, S(:,6)))*P(6) + A(1, S(:,5))*P(5);

dP(7) =   A(3, S(:,6))*P(6);

end

