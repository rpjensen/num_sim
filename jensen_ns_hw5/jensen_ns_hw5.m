% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Homework 5

% Problem based on rhs.m
A = [-80.6, 119.4; 79.6, -120.4];
%% Problem 1
clc

y0 = [1 4];
t = [0 1];

[T,Y] = ode45(@rhs, t, y0);

close ALL;
plot(T, Y(:,1), 'r--', T, Y(:,2), 'k-');

%% Problem 2
clc
[V, D] = eigs(A);
lambda1 = D(1,1);
lambda2 = D(2,2);
v1 = V(:,1);
v2 = V(:,2);
fprintf('Lambda 1: %f\n', lambda1);
fprintf('V1: ');
fprintf('\t%f\n', v1);
fprintf('\nLambda 2: %f\n', lambda2);
fprintf('V2: ');
fprintf('\t%f\n', v2);

%% Problem 3

% Since the -200 term dominates in this equation e^(-200t) + e^(-t) I think
% it is fair to only look at that term. Translating into the test equation
% y' = lambda y
% gives a Forward Euler step-size constraint 
% -2 < h*lambda < 0 ==> -2 < (-200)*h < 0 ==> 1/100 > h > 0 ==> h < 1/100
% Real solution just to help with the calculations

% Starting equation: y0 = c1*v1 + c2*v2;
% f = @(c) c(1)*v1 - c(2)*v2 - y0;
% c = fsolve(f, [1 1]');
% f = @(t) c(1)*v1*exp(lambda1*t) + c(2)*v2*exp(lambda2*t);

%% Problem 4
clc
[T1,Y1] = forwardEuler(@rhs, 0.005, t(1), t(2), y0);
[T2,Y2] = forwardEuler(@rhs, 0.008, t(1), t(2), y0);
[T3,Y3] = forwardEuler(@rhs, 0.010, t(1), t(2), y0);
[T4,Y4] = forwardEuler(@rhs, 0.012, t(1), t(2), y0);


close ALL;
figure
plot(T1, Y1(:,1), 'r--', T1, Y1(:,2), 'b-');
title('Stepsize: 0.005')
figure
plot(T2, Y2(:,1), 'r--', T2, Y2(:,2), 'b-');
title('Stepsize: 0.008')
figure
plot(T3, Y3(:,1), 'r--', T3, Y3(:,2), 'b-');
title('Stepsize: 0.010')
figure
plot(T4, Y4(:,1), 'r--', T4, Y4(:,2), 'b-');
title('Stepsize: 0.012')

%% Problem 5
% backwardEuler.m

%% Problem 6
clc

J = @(t,y) A;
[Tapx, Yapx] = backwardEuler(@rhs, J, 0.02, t(1), t(2), y0);


close ALL;
plot(T, Y(:,1), 'r--', T, Y(:,2), 'k-');
figure
plot(Tapx, Yapx(:,1), 'r--', Tapx, Yapx(:,2), 'k-');
figure
plot(Y(:,1), Y(:,2), 'r--', Yapx(:,1), Yapx(:,2), 'k-');
