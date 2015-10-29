% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Midterm 2


%% Problem 1.a
clc;
nu = [[-1 -1 1 0]', [1 1 -1 0]', [0 1 -1 1]'];
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%% 
nA = 6.023e23; % Avagadro?s number
vol = 1e-17; % volume of system

x = zeros(4,1);
x(1) = round(5e-7*nA*vol); % molecules of substrate
x(2) = round(2e-7*nA*vol); % molecules of enzyme

fprintf('The population of the substrate is %.2f\n', x(1));
fprintf('The population of the enzyme is %.2f\n', x(2));

c(1) = 1e6/(nA*vol); 
c(2) = 1e-4; 
c(3) = 0.1;


fprintf('The value of the c(1) is %.5f\n', c(1));
fprintf('The value of the c(2) is %.5f\n', c(2));
fprintf('The value of the c(3) is %.5f\n', c(3));

%% Problem 1.b

S = [[3 1 0 0]', [2 0 1 0]', [2 1 0 1]', [1 0 1 1]', [1 1 0 2]', [0 0 1 2]', [0 1 0 3]'];

%% Problem 1.d
% See RHS.m
clc
[T,P] = ode45(@RHS, 0:.5:50, [1 0 0 0 0 0 0]');
close ALL;

% figure;
% plot(T, P(:,1), 'k-', T, P(:,2), 'b-', T, P(:,3), 'r-', T, P(:,4), 'g-', T, P(:,5), 'c-', T, P(:,6), 'y-', T, P(:,7), 'm-');
% ylim([0 1.2]);
% 
% legend('P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7');


%% Problem 1.e
clc;
mu = P * S';
std = sqrt(P * (S' .* S') - (mu.*mu));


close ALL;
figure
plot(T, mu(:,1), 'k-', T, mu(:,2), 'b-', T, mu(:,3), 'r-', T, mu(:,4), 'g-');
upper = mu+std;
lower = mu-std;

hold on;
plot(T, upper(:,1), 'k--', T, upper(:,2), 'b--', T, upper(:,3), 'r--', T, upper(:,4), 'g--');
hold on;
plot(T, lower(:,1), 'k--', T, lower(:,2), 'b--', T, lower(:,3), 'r--', T, lower(:,4), 'g--');
ylim([0 3.5]);
legend('P1', 'P2', 'P3', 'P4');

%% Problem 1.f
% The limit of x2 as t--> inf is 1
% The probability of state 7: [0 1 0 3] is 1 as t--> inf and x2 = 1 in that
% state so the limit as t--> inf of x2 is just the value in that state.


%%
%% Problem 2.a
% See written work
clc;
% Matlab answer check
mean([4 3 11 2])
var([4 3 11 2])


%% Problem 2.b
% ssaStats.m

%% Problem 2.c
clc;

nu = [[-1 1]', [1 -1]'];

x0 = [100, 0]';
T = 0:50;
realizations = 1000;
% Really long process
[T, xMean, xVar] = ssaStats(x0,@A2 ,nu,T,realizations);

xStd = sqrt(xVar);

%% Short process (graph)
close all;
figure;
plot(T, xMean(:,1), 'b-', T, xMean(:,2), 'r-');
upper = xMean+xStd;
lower = xMean-xStd;

hold on;
plot(T, upper(:,1), 'b--', T, upper(:,2), 'r--');
hold on;
plot(T, lower(:,1), 'b--', T, lower(:,2), 'r--');
ylim([0 max(max(upper))]);
legend('X1', 'X2');

%% Problem 2.d
realizations = 1;
% Really long process
[TD, xMeanD, xVarD] = ssaStats(x0,@A2 ,nu,T,realizations);

xStdD = sqrt(xVarD);

%% Short process
hold on;
plot(TD, xMeanD(:,1), 'g-', TD, xMeanD(:,2), 'k-');



