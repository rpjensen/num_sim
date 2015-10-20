% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Homework 7



%% Problem 1.a
clc;
propensityFunction = @(x) .5*x(1);

x0 = 100;
tFinal = 15;
nu = -1;

[T, Y] = ssa(x0, propensityFunction, nu, tFinal);


%% Checking my work area against the exppdf normalized for the inital population
figure;
plot(T, Y, 'k-')
hold on;
mu = 2;
t = 0:.01:15;
plot(t, x0*mu*exppdf(t, mu), 'b-');

%% Graph for 1.a

close ALL;

figure
steps = 100:-1:0;
% Typically we need zero to appear twice since the times were stretch to 15
% seconds always
if length(steps) < length(T)
    steps = [steps 0];
end
stairs(T,steps);
xlim([0 max(T)*1.1]);


%% Problem 1.b
% See mMenten1.m
clc;
nu = [[-1 -1 1 0]', [1 1 -1 0]', [0 1 -1 1]'];
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%% 
nA = 6.023e23; % Avagadro?s number
vol = 1e-15; % volume of system
tFinal = 50;

x0 = zeros(4,1);
x0(1) = round(5e-7*nA*vol); % molecules of substrate
x0(2) = round(2e-7*nA*vol); % molecules of enzyme

[T, Y] = ssa(x0, @mMenten1, nu, tFinal);

close ALL;
% Part i
figure;
plot(T, Y(:,1), 'g-', T, Y(:,2), 'b-', T, Y(:,3), 'k-', T, Y(:,4), 'r-');
legend('s1', 's2', 's3', 's4');
% Part ii
figure
plot(T, Y(:,1), 'g-', T, Y(:,4), 'r-');
legend('substrate', 'product');

% Part iii

[tZoom, yZoom] = partIIIZoom(T, Y);
figure
plot(tZoom, yZoom(:,1), 'g-', tZoom, yZoom(:,4), 'r-');
legend('substrate', 'product');



%% Problem 1.c
% See mMenten2.m
clc;
nu = [[-1 -1 1 0]', [1 1 -1 0]', [0 1 -1 1]'];
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%% 
nA = 6.023e23; % Avagadro?s number
vol = 3e-15; % volume of system
tFinal = 50;

x0 = zeros(4,1);
x0(1) = round(5e-7*nA*vol); % molecules of substrate
x0(2) = round(2e-7*nA*vol); % molecules of enzyme

[T, Y] = ssa(x0, @mMenten2, nu, tFinal);

% Part i
% I got 1744 Rows for the run with a higher volume
% For Part b I got 594 rows

close ALL;
% Part ii
figure;
plot(T, Y(:,1), 'g-', T, Y(:,2), 'b-', T, Y(:,3), 'k-', T, Y(:,4), 'r-');
legend('s1', 's2', 's3', 's4');
