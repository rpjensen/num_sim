% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Tau Test


%% Test 2 problem
clc;

nu = [[-1 1]', [1 -1]'];
g = [1 1]';

x0 = [100, 0]';
tFinal = 5;

tic;
[T, P] = tau(x0, @A2, nu, tFinal, g);
tauTime = toc;
tic;
[TS, PS] = ssaOrig(x0,@A2,nu,tFinal);
ssaTime = toc;


fprintf('\nThe time for tau was %f\n', tauTime);
fprintf('The time for ssa was %f\n', ssaTime);

fprintf('\nNumber of Tau samples %f\n', length(T));
fprintf('Number of SSA samples %f\n', length(TS));


close all;
figure;
plot(T, P(:,1), 'b-', T, P(:,2), 'r-');
hold on;
plot(TS, PS(:,1), 'c--', TS, PS(:,2), 'm--');
legend('T1', 'T2', 'S1', 'S2');

figure;
plot(T(1:end-1), diff(T), 'b-');
hold on;
plot(TS(1:end-1), diff(TS), 'r-');
legend('Tau stepsize vs time', 'SSA stepsize vs time');

%% Menton Model
clc;
nu = [[-1 -1 1 0]', [1 1 -1 0]', [0 1 -1 1]'];
g = [2 2 1 1]';
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%% 
nA = 6.023e23; % Avagadro?s number
vol = 1e-13; % volume of system

x0 = zeros(4,1);
x0(1) = round(5e-7*nA*vol); % molecules of substrate
x0(2) = round(2e-7*nA*vol); % molecules of enzyme

tFinal = 50;

x0

tic;
[T, P] = tau(x0, @mMenten2, nu, tFinal, g);
tauTime = toc;
tic;
[TS, PS] = ssaOrig(x0,@mMenten2,nu,tFinal);
ssaTime = toc;


fprintf('\nThe time for tau was %f\n', tauTime);
fprintf('The time for ssa was %f\n', ssaTime);

fprintf('\nNumber of Tau samples %f\n', length(T));
fprintf('Number of SSA samples %f\n', length(TS));


close all;
figure;
plot(T, P(:,1), 'b-', T, P(:,4), 'r-');%, T, P(:,3), 'g-', T, P(:,4), 'y-');
hold on;
plot(TS, PS(:,1), 'c--', TS, PS(:,4), 'm--');%, TS, PS(:,1), 'y--', TS, PS(:,2), 'g--');
legend('T1', 'T4', 'S1', 'S4');

figure;
plot(T(1:end-1), diff(T), 'b-');
hold on;
plot(TS(1:end-1), diff(TS), 'r-');
legend('Tau stepsize vs time', 'SSA stepsize vs time');


%% Statistics

%% Exam 2 Problem
clc;

nu = [[-1 1]', [1 -1]'];
g = [1, 1]';

x0 = [300, 0]';
T = 0:.1:5;
realizations = 200;
%% Really really long process
clc
[T, xMean, xVar] = tauStats(x0,@A2 ,nu,T,realizations, g);

xStd = sqrt(xVar);

%%
clc
[TS, xMeanS, xVarS] = ssaStats(x0,@A2 ,nu,T,realizations);

xStdS = sqrt(xVarS);

%% Short process (graph)

%%
close all;
figure;
plot(T, xMean(:,1), 'b-', T, xMean(:,2), 'r-');
hold on;
plot(TS, xMeanS(:,1), 'c-', TS, xMeanS(:,2), 'm-');

upper = xMean+xStd;
lower = xMean-xStd;
upperS = xMeanS+xStdS;
lowerS = xMeanS-xStdS;

hold on;
plot(T, upper(:,1), 'b--', T, upper(:,2), 'r--');
hold on;
plot(T, lower(:,1), 'b--', T, lower(:,2), 'r--');
hold on;
plot(TS, upperS(:,1), 'c--', TS, upperS(:,2), 'm--');
hold on;
plot(TS, lowerS(:,1), 'c--', TS, lowerS(:,2), 'm--');
ylim([0 max(max(max(upper, upperS)))]);
legend('T1', 'T2', 'S1', 'S2');


%% Menten model
clc;

nu = [[-1 -1 1 0]', [1 1 -1 0]', [0 1 -1 1]'];
g = [2 2 1 1]';
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%% 
nA = 6.023e23; % Avagadro?s number
vol = 1e-14; % volume of system

x0 = zeros(4,1);
x0(1) = round(5e-7*nA*vol); % molecules of substrate
x0(2) = round(2e-7*nA*vol); % molecules of enzyme

T = 0:50;
realizations = 200;
%% Really really long process
clc
[T, xMean, xVar] = tauStats(x0,@mMenten2 ,nu,T,realizations, g);

xStd = sqrt(xVar);

%%
clc
[TS, xMeanS, xVarS] = ssaStats(x0,@mMenten2 ,nu,T,realizations);

xStdS = sqrt(xVarS);

%% Short process (graph)

%%
close all;
figure;
plot(T, xMean(:,1), 'b-', T, xMean(:,4), 'r-');
hold on;
plot(TS, xMeanS(:,1), 'c-', TS, xMeanS(:,4), 'm-');

upper = xMean+xStd;
lower = xMean-xStd;
upperS = xMeanS+xStdS;
lowerS = xMeanS-xStdS;

hold on;
plot(T, upper(:,1), 'b--', T, upper(:,4), 'r--');
hold on;
plot(T, lower(:,1), 'b--', T, lower(:,4), 'r--');
hold on;
plot(TS, upperS(:,1), 'c--', TS, upperS(:,4), 'm--');
hold on;
plot(TS, lowerS(:,1), 'c--', TS, lowerS(:,4), 'm--');
ylim([0 max(max(max(upper, upperS)))]);
legend('T1', 'T4', 'S1', 'S4');



