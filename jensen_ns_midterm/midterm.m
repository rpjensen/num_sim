% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Midterm 1

%% Problem 3
% See: rk12.m


%% Problem 3.a
clc

dy = @(t,y) y*(1-y/10);
y0 = 2;
TOL = 1e-4;
t = 0:0.2:20;

[t,y,steps] = rk12(dy, t,y0,TOL);

%% Exact-ish
odeTOL = 1e-7;
options = odeset('RelTol', odeTOL, 'AbsTol', odeTOL);
[tEx, yEx] = ode45(dy, t, y0, options);

%% 3.b

close ALL;
 

figure
plot(t, yEx, 'k-', t, y, 'r--');

legend('ode45', 'rk12');


%%
yEx = @(t) 1000*exp(0.1*t);
dy = @(t,y) .1*y;
y0 = 1000;
t = [0, 5];

h = 0.1;
[tApx1, yApx1] = improvedEuler(dy,h,t(1),t(2),y0);
e = abs(yEx(tApx1(end)) - yApx1(end,1));
fprintf('IE: The error with stepsize %1.2f is %f\n\tExact: %1.2f --- Estimate: %1.2f\n',h, e, yEx(tApx1(end)), yApx1(end,1));

h = 0.2;
[tApx2, yApx2] = improvedEuler(dy,h,t(1),t(2),y0);
e = abs(yEx(tApx2(end)) - yApx2(end,1));
fprintf('FE: The error with stepsize %1.2f is %f\n\tExact: %1.2f --- Estimate: %1.2f\n',h, e, yEx(tApx2(end)), yApx2(end,1));


close ALL;
plot(tApx1, yEx(tApx1), 'k-', tApx1, yApx1, 'r--', tApx2, yApx2, 'b:');

%% Problem 3
clc

y0 = [1, 0.5]';
t = [0 5];
h = 0.1;

[tApx, yApx] = improvedEuler(@problem3,h,t(1),t(2),y0);
[tApxOld, yApxOld] = forwardEuler(@problem3,h,t(1),t(2),y0);
[tExt, yExt] = ode45(@problem3, t, y0);



close ALL;
 

figure
plot(tApx, yApx(:,1), 'k-', tApx, yApx(:,2), 'r--');

figure
plot(yExt(:,1), yExt(:,2), 'k-', yApx(:,1), yApx(:,2), 'r--', yApxOld(:,1), yApxOld(:,2), 'b:');
legend('Exact', 'Improved Euler', 'Forward Euler');

%% Problem 4
clc

y0 = [1, 0.5]';
t = [0 5];


steps = .2:-.02:.02;
errors = zeros(length(steps), 2);


for i = 1:length(steps)
    h = steps(i);
    numSteps = ceil((t(2)-t(1))/h);
    

    [tApx, yApx] = improvedEuler(@problem3,h,t(1),t(2),y0);
    [tExt, yExt] = ode45(@problem3, t, y0);
    errors(i,:) = [numSteps, norm(yExt(end,:)-yApx(end,:))];
end

close ALL;
 

figure

plot(errors(:,1), errors(:,2), 'k-');

figure

x = [3.2:.2:4];
y = -2*x + 2.7; % Line of so so fit ;)

plot(log(errors(:,1)), log(errors(:,2)), 'k-', x, y, 'r--');

% --Summary--
% The log-log plot does seem to be linear for the first half but the
% benefits of smaller step sizes seem to drop off around e^4 (steps) so the
% graph starts to flatten out. This is likely due to the step size being to
% small or some sort of stability problem. I am not really sure what it is.

%% Problem 5
clc
% a:
% x0 = 3
% 
% f(x) = x^3 - 17
% f' = 3x^2
% 
% ---- Find x0 st f(x0)=0 ----
% 
% x1 = 3 - f(3)/f'(3) = 3 - (10/27) = 81/27 - 10/27 = 71/27 = 2.63
% x2 = 71/27 - f(71/27)/f'(71/27) = 2.63 - 1.18/18.19 = 2.57

% b: See newton.m

% c:
f = @(x) cos(x) - x;
df = @(x) -sin(x) - 1;

x0 = 1;

sol = newton(x0, f, df)
f(sol)

% d:
f = @(x) x^3 - 17;
df = @(x) 3*x^2;

x0 = 3;

sol = newton(x0, f, df)
f(sol)

