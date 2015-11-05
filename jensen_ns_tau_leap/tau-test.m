% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Tau Test



%% Problem 1.a
clc;
propensityFunction = @(x) .5*x(1);

x0 = 100;
tFinal = 15;
nu = -1;

[T, Y] = tau(x0, propensityFunction, nu, tFinal);

%%
clc;

nu = [[-1 1]', [1 -1]'];

x0 = [100, 0]';
tFinal = 50;
step = .01;
tic;
[T, P] = tau(x0,@A2,nu,tFinal,step);
tauTime = toc;
tic;
[TS, PS] = ssa(x0,@A2,nu,tFinal);
ssaTime = toc;

fprintf('The time for tau was %g\n', tauTime);
fprintf('The time for ssa was %g\n', ssaTime);


close all;
figure;
plot(T, P(:,1), 'b-', T, P(:,2), 'r-');
hold on;
plot(TS, PS(:,1), 'c--', TS, PS(:,2), 'm--');
