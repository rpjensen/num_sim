%% Problem 1 - See forwardEuler.m

%% Problem 2 
clc;
dy = @(t, y) 0.1 * y;
y0 = 1000;
t = [0, 5];

yExt = @(t) 1000*exp(0.1*t);
yExt5 = yExt(5);

h1 = 0.1;
[t1, y1] = forwardEuler(dy,h1,t(1),t(2),y0);
e1 = yExt5 - y1(end,1);
fprintf('The error with stepsize %1.2f is %f\n\tExact: %1.2f --- Estimate: %1.2f\n',h1, e1, yExt5, y1(end,1));
h2 = 0.2;
[t2, y2] = forwardEuler(dy,h2,t(1),t(2),y0);
e2 = yExt5 - y2(end,1);
fprintf('The error with stepsize %.2f is %f\n\tExact: %1.2f --- Estimate: %1.2f\n',h2, e2, yExt5, y2(end,1));

close ALL;
plot(t1, yExt(t1), 'k-', t1, y1, 'r--', t2, y2, 'b:');

%% Problem 3
clc;
y0 = [1, 0.5]';
t0 = [0, 5];

[t,yExt] = ode45(@prob3RHS,t0,y0);
yExt5 = yExt(end,:);

h1 = 0.1;
[t1, y1] = forwardEuler(@prob3RHS,h1,t0(1),t0(2),y0);
e1 = norm(yExt5 - y1(end,:));
fprintf('The error with stepsize %1.2f is %f\n',h1, e1);
h2 = 0.01;
[t2, y2] = forwardEuler(@prob3RHS,h2,t0(1),t0(2),y0);
e2 = norm(yExt5 - y2(end,:));
fprintf('The error with stepsize %.2f is %f\n',h2, e2);

close ALL;
figure
plot(t1, y1(:,1), 'k-', t1, y1(:,2), 'r--');
figure
plot(t2, y2(:,1), 'k-', t2, y2(:,2), 'r--');
figure
plot(yExt(:,1), yExt(:,2), 'k-', y1(:,1), y1(:,2), 'r--', y2(:,1), y2(:,2), 'b:');

%% Problem 4
clc;
y0 = [9, 8, 27]';
t0 = [0, 35];

[t,yExt] = ode45(@lorenzRHS,t0,y0);

h1 = 0.01;
[t1, y1] = forwardEuler(@lorenzRHS,h1,t0(1),t0(2),y0);


close ALL;
figure
plot(y1(:,2), y1(:,1), 'r--');
figure
plot(yExt(:,2), yExt(:,1), 'k-');

% It is similar but the eddies are definitely off on the left part of the
% swirl.