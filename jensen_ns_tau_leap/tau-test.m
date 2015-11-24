% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Tau Test


%%
clc;

nu = [[-1 1]', [1 -1]'];
g = [1 1]';

x0 = [300, 0]';
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