% Ryan Jensen
% CSCI 373
% Prof. Sanft
% Midterm 1

%% Problem 3
% See: rk12.m


%% ====== Problem 3.a ====== 
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


%% ====== Problem 3.b ====== 

close ALL;
 

figure
plot(t, yEx, 'k-', t, y, 'r--');

legend('ode45', 'rk12');


%% ====== Problem 3.c ====== 
close ALL;
 

figure
plot(t, abs(yEx-y), 'bo');

legend('abs(err)');

%% ====== Problem 3.d ====== 
close ALL;
 

figure
plot(steps(:,1), steps(:,2), 'bo');

%% ====== Problem 3.e.a ====== 
clc

dy = @(t,y) y*(1-y/10);
y0 = 2;
TOL = 1e-5;
t = 0:0.2:20;

[t,y,steps] = rk12(dy, t,y0,TOL);

%% Exact-ish
odeTOL = 1e-7;
options = odeset('RelTol', odeTOL, 'AbsTol', odeTOL);
[tEx, yEx] = ode45(dy, t, y0, options);

%% 3.e.b

close ALL;
 

figure
plot(t, yEx, 'k-', t, y, 'r--');

legend('ode45', 'rk12');


%% 3.e.c
close ALL;
 

figure
plot(t, abs(yEx-y), 'bo');

legend('abs(err)');

%% 3.e.d
close ALL;
 

figure
plot(steps(:,1), steps(:,2), 'bo');

%%  ====== Problem 3.f.a ====== 
clc

dy = @(t,y) y*(1-y/10);
y0 = 2;
TOL = 1e-5;
t = [0 20];

[t,y,steps] = rk12(dy, t,y0,TOL);

%% 3.f.d
close ALL;
 

figure
plot(steps(:,1), steps(:,2), 'bo');
