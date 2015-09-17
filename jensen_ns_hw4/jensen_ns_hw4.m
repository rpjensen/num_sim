% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Homework 4


%% Problem 1
% f1.m

%% Problem 2
% J1.m
clc
J1(1,2)
J1(2,3)

%% Problem 3
% backwardEulerNewton.m

%% Problem 4
clc
backwardEulerNewton(1,5,4,@f1, @J1)

%% Problem 5
% backwardEuler.m

%% Problem 6
clc
f = @(t,y) -100*(y-sin(t));
J = @(t,y) -100;


t = [0 3];
y0 = 1;
h = .25;

[tMine, yMine] = backwardEuler(f, J, h, t(1), t(2), y0);
[tReal, yReal] = ode45(f, t, y0);


close ALL;

figure
plot(tReal, yReal(:,1), 'r--', tMine, yMine(:,1), 'k-');
legend('Exact', 'Backward Euler');