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
% legend('P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7');


%% Problem 1.e
clc;
means = P * S';


%% Problem 1.a
clc;
propensityFunction = @(x) .5*x(1);

x0 = 100;
tFinal = 15;
nu = -1;

[T, Y] = ssa(x0, propensityFunction, nu, tFinal);


%% Checking my work area against the exppdf normalized for the inital population
close ALL;
figure;
stairs(T, Y, 'k-')
hold on;
mu = 2;
t = 0:.01:15;
plot(t, x0*mu*exppdf(t, mu), 'b-');

%% Graph for 1.a

close ALL;

figure
stairs(T,Y);
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
stairs(tZoom, yZoom(:,1), 'g-');
hold on;
stairs(tZoom, yZoom(:,4), 'r-');
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
% I got 1744 Rows (time points/reaction count) for the run with a higher volume
% For Part b I got 594 (time points/reaction count) rows

close ALL;
% Part ii
figure;
plot(T, Y(:,1), 'g-', T, Y(:,2), 'b-', T, Y(:,3), 'k-', T, Y(:,4), 'r-');
legend('s1', 's2', 's3', 's4');
